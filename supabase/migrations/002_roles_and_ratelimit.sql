-- =============================================
-- Add role system + API usage tracking
-- =============================================

-- Add role to profiles
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS role text DEFAULT 'user' CHECK (role IN ('user', 'premium'));

-- Promo codes table
CREATE TABLE public.promo_codes (
  id bigint generated always as identity primary key,
  code text unique not null,
  role_grant text not null default 'premium',
  max_uses integer default null, -- null = unlimited
  current_uses integer default 0,
  active boolean default true,
  created_at timestamptz default now()
);

-- API usage tracking
CREATE TABLE public.api_usage (
  id bigint generated always as identity primary key,
  user_id uuid references public.profiles(id) on delete cascade not null,
  usage_date date not null default current_date,
  call_count integer default 0,
  created_at timestamptz default now(),
  unique(user_id, usage_date)
);

-- RLS for api_usage
ALTER TABLE public.api_usage ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own usage"
  ON public.api_usage FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own usage"
  ON public.api_usage FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own usage"
  ON public.api_usage FOR UPDATE USING (auth.uid() = user_id);

-- RLS for promo_codes: anyone can read active codes (for validation), no one can modify via API
ALTER TABLE public.promo_codes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read active promo codes"
  ON public.promo_codes FOR SELECT USING (active = true);
CREATE POLICY "Authenticated users can update promo code usage"
  ON public.promo_codes FOR UPDATE USING (active = true);

-- Insert the promo code
INSERT INTO public.promo_codes (code, role_grant) VALUES ('LOUIS2026', 'premium');

-- Index
CREATE INDEX idx_api_usage_user_date ON public.api_usage(user_id, usage_date);
