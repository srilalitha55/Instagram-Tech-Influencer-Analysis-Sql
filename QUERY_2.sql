SELECT
  post_type,
  MAX(impressions) AS highest_impressions,
  MIN(impressions) AS lowest_impressions
FROM gdb0120.fact_content
GROUP BY post_type
ORDER BY post_type;