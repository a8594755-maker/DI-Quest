-- =============================================
-- Chat sessions cloud sync (30-day retention)
-- =============================================

CREATE TABLE public.chat_sessions (
  id text NOT NULL,
  user_id uuid REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  title text,
  messages jsonb DEFAULT '[]',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  PRIMARY KEY (id, user_id)
);

-- RLS
ALTER TABLE public.chat_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own chat sessions"
  ON public.chat_sessions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own chat sessions"
  ON public.chat_sessions FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own chat sessions"
  ON public.chat_sessions FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own chat sessions"
  ON public.chat_sessions FOR DELETE USING (auth.uid() = user_id);

-- Index for fast lookup
CREATE INDEX idx_chat_sessions_user_updated ON public.chat_sessions(user_id, updated_at DESC);
