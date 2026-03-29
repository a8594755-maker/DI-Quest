-- Admin notes on user profiles
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS admin_notes text DEFAULT NULL;

-- Announcements table
CREATE TABLE IF NOT EXISTS public.announcements (
  id bigint generated always as identity primary key,
  title text NOT NULL,
  content text NOT NULL,
  type text DEFAULT 'info' CHECK (type IN ('info', 'warning', 'update', 'event')),
  is_active boolean DEFAULT true,
  created_by uuid REFERENCES public.profiles(id),
  created_at timestamptz DEFAULT now(),
  expires_at timestamptz
);

ALTER TABLE public.announcements ENABLE ROW LEVEL SECURITY;

-- Anyone can read active announcements
CREATE POLICY "Anyone can view active announcements"
  ON public.announcements FOR SELECT
  USING (is_active = true OR public.is_admin());

-- Only admin can manage
CREATE POLICY "Admin can insert announcements"
  ON public.announcements FOR INSERT
  WITH CHECK (public.is_admin());

CREATE POLICY "Admin can update announcements"
  ON public.announcements FOR UPDATE
  USING (public.is_admin());

CREATE POLICY "Admin can delete announcements"
  ON public.announcements FOR DELETE
  USING (public.is_admin());
