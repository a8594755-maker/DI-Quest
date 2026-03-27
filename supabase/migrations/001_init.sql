-- =============================================
-- DI Quest: Auth, Streaks, Friends Schema
-- =============================================

-- profiles (extends auth.users)
create table public.profiles (
  id uuid references auth.users(id) on delete cascade primary key,
  username text unique not null,
  display_name text,
  avatar_url text,
  total_xp integer default 0,
  streak_days integer default 0,
  longest_streak integer default 0,
  last_active_date date,
  streak_freezes integer default 1,
  created_at timestamptz default now()
);

-- daily_checkins
create table public.daily_checkins (
  id bigint generated always as identity primary key,
  user_id uuid references public.profiles(id) on delete cascade not null,
  checkin_date date not null default current_date,
  xp_earned integer default 0,
  challenges_completed integer default 0,
  used_freeze boolean default false,
  created_at timestamptz default now(),
  unique(user_id, checkin_date)
);

-- user_progress (replaces localStorage for logged-in users)
create table public.user_progress (
  user_id uuid references public.profiles(id) on delete cascade primary key,
  progress_data jsonb default '{}',
  updated_at timestamptz default now()
);

-- friendships
create table public.friendships (
  id bigint generated always as identity primary key,
  requester_id uuid references public.profiles(id) on delete cascade not null,
  addressee_id uuid references public.profiles(id) on delete cascade not null,
  status text check (status in ('pending', 'accepted', 'declined')) default 'pending',
  created_at timestamptz default now(),
  unique(requester_id, addressee_id)
);

-- weekly_leaderboard view
create view public.weekly_leaderboard as
select
  p.id,
  p.username,
  p.display_name,
  p.avatar_url,
  p.streak_days,
  coalesce(sum(dc.xp_earned), 0) as weekly_xp
from public.profiles p
left join public.daily_checkins dc
  on dc.user_id = p.id
  and dc.checkin_date >= current_date - interval '7 days'
group by p.id, p.username, p.display_name, p.avatar_url, p.streak_days;

-- =============================================
-- Row Level Security
-- =============================================

alter table public.profiles enable row level security;
alter table public.daily_checkins enable row level security;
alter table public.user_progress enable row level security;
alter table public.friendships enable row level security;

-- profiles: anyone can read, only owner can update/insert
create policy "Public profiles are viewable by everyone"
  on public.profiles for select using (true);
create policy "Users can update own profile"
  on public.profiles for update using (auth.uid() = id);
create policy "Users can insert own profile"
  on public.profiles for insert with check (auth.uid() = id);

-- daily_checkins: owner only
create policy "Users can view own checkins"
  on public.daily_checkins for select using (auth.uid() = user_id);
create policy "Users can insert own checkins"
  on public.daily_checkins for insert with check (auth.uid() = user_id);
create policy "Users can update own checkins"
  on public.daily_checkins for update using (auth.uid() = user_id);

-- user_progress: owner only
create policy "Users can view own progress"
  on public.user_progress for select using (auth.uid() = user_id);
create policy "Users can insert own progress"
  on public.user_progress for insert with check (auth.uid() = user_id);
create policy "Users can update own progress"
  on public.user_progress for update using (auth.uid() = user_id);

-- friendships: both parties can read; requester can insert; addressee can update
create policy "Users can view own friendships"
  on public.friendships for select
  using (auth.uid() = requester_id or auth.uid() = addressee_id);
create policy "Users can send friend requests"
  on public.friendships for insert with check (auth.uid() = requester_id);
create policy "Addressee can update friendship status"
  on public.friendships for update using (auth.uid() = addressee_id);
create policy "Users can delete own friendships"
  on public.friendships for delete
  using (auth.uid() = requester_id or auth.uid() = addressee_id);

-- =============================================
-- Trigger: auto-create profile on signup
-- =============================================

create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, username, display_name)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'username', 'user_' || substr(new.id::text, 1, 8)),
    coalesce(new.raw_user_meta_data->>'display_name', new.raw_user_meta_data->>'username', 'Learner')
  );
  insert into public.user_progress (user_id) values (new.id);
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Indexes
create index idx_daily_checkins_user_date on public.daily_checkins(user_id, checkin_date);
create index idx_friendships_requester on public.friendships(requester_id);
create index idx_friendships_addressee on public.friendships(addressee_id);
