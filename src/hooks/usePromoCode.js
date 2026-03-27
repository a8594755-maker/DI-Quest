import { useState } from 'react'
import { supabase } from '../utils/supabase'
import { useAuth } from '../contexts/AuthContext'

export function usePromoCode() {
  const { user, fetchProfile } = useAuth()
  const [loading, setLoading] = useState(false)

  const redeemCode = async (code) => {
    if (!user) throw new Error('Must be logged in')
    setLoading(true)

    try {
      // Look up the promo code
      const { data: promo, error: promoError } = await supabase
        .from('promo_codes')
        .select('*')
        .eq('code', code.toUpperCase().trim())
        .eq('active', true)
        .maybeSingle()

      if (!promo) throw new Error('INVALID_CODE')
      if (promo.max_uses && promo.current_uses >= promo.max_uses) throw new Error('CODE_EXPIRED')

      // Update user role
      const { error: updateError } = await supabase
        .from('profiles')
        .update({ role: promo.role_grant })
        .eq('id', user.id)

      if (updateError) throw updateError

      // Increment usage count
      await supabase
        .from('promo_codes')
        .update({ current_uses: promo.current_uses + 1 })
        .eq('id', promo.id)

      // Refresh profile
      await fetchProfile(user.id, user.user_metadata)

      return { success: true, role: promo.role_grant }
    } finally {
      setLoading(false)
    }
  }

  return { redeemCode, loading }
}
