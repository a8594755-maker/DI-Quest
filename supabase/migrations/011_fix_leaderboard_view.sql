-- Fix weekly_leaderboard view: add total_xp for correct level display
-- Must DROP + CREATE because adding a column changes the view signature
DROP VIEW IF EXISTS public.weekly_leaderboard;

CREATE VIEW public.weekly_leaderboard AS
SELECT
  p.id,
  p.username,
  p.display_name,
  p.avatar_url,
  p.total_xp,
  p.streak_days,
  coalesce(sum(dc.xp_earned), 0) AS weekly_xp
FROM public.profiles p
LEFT JOIN public.daily_checkins dc
  ON dc.user_id = p.id
  AND dc.checkin_date >= current_date - interval '7 days'
GROUP BY p.id, p.username, p.display_name, p.avatar_url, p.total_xp, p.streak_days;
