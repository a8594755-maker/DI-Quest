-- visitor_logs: track all visits (guests + authenticated users)
create table public.visitor_logs (
  id bigint generated always as identity primary key,
  user_id uuid references public.profiles(id) on delete set null,
  is_guest boolean default true,
  ip_address text,
  user_agent text,
  referrer text,
  page_path text,
  visited_at timestamptz default now()
);

-- Index for admin queries
create index idx_visitor_logs_visited_at on public.visitor_logs(visited_at desc);
create index idx_visitor_logs_ip on public.visitor_logs(ip_address);

-- RLS
alter table public.visitor_logs enable row level security;

-- Anyone (including anon) can insert
create policy "Anyone can log visits"
  on public.visitor_logs for insert
  with check (true);

-- Only admin can read
create policy "Admin can view visitor logs"
  on public.visitor_logs for select
  using (public.is_admin());
