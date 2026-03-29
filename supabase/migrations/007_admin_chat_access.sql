-- Allow admin to view all chat sessions (skip if already exists)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE policyname = 'Admin can view all chat sessions' AND tablename = 'chat_sessions'
  ) THEN
    CREATE POLICY "Admin can view all chat sessions"
      ON public.chat_sessions FOR SELECT
      USING (public.is_admin());
  END IF;
END $$;
