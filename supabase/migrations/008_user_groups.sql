-- Add user_group column to profiles for admin categorization
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS user_group text DEFAULT NULL;
