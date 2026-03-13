SELECT
  dd.month_name,
  SUM(fa.profile_visits) AS total_profile_visits,
  SUM(fa.new_followers)  AS total_new_followers
FROM gdb0120.fact_account fa
JOIN gdb0120.dim_dates dd
  ON dd.date = fa.date
GROUP BY dd.month_name
ORDER BY MIN(dd.date);
