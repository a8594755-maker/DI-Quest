-- =============================================
-- Admin role + RLS policies for admin access
-- =============================================

-- 1. Extend role constraint to include 'admin'
ALTER TABLE public.profiles DROP CONSTRAINT IF EXISTS profiles_role_check;
ALTER TABLE public.profiles ADD CONSTRAINT profiles_role_check
  CHECK (role IN ('user', 'premium', 'admin'));

-- 2. Helper function: check if current user is admin
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid() AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- 3. Admin RLS policies (allow admin to SELECT all rows)
CREATE POLICY "Admin can view all checkins"
  ON public.daily_checkins FOR SELECT USING (public.is_admin());

CREATE POLICY "Admin can view all progress"
  ON public.user_progress FOR SELECT USING (public.is_admin());

CREATE POLICY "Admin can view all usage"
  ON public.api_usage FOR SELECT USING (public.is_admin());

CREATE POLICY "Admin can view all chat sessions"
  ON public.chat_sessions FOR SELECT USING (public.is_admin());

-- 4. Admin promo code (max_uses = 1, only one admin)
INSERT INTO public.promo_codes (code, role_grant, max_uses)
VALUES ('DIADMIN2026', 'admin', 1);
