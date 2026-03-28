-- =============================================
-- Admin actions: role management + API blocking
-- =============================================

-- 1. Add api_blocked column to profiles
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS api_blocked boolean DEFAULT false;

-- 2. Allow admin to update any profile (for role grants + API blocking)
CREATE POLICY "Admin can update all profiles"
  ON public.profiles FOR UPDATE USING (public.is_admin());
