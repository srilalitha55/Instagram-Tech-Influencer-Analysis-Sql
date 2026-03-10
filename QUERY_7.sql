SELECT
  post_type,
  SUM(reach) AS total_reach,
  ROUND(100 * SUM(reach) / SUM(SUM(reach)) OVER (), 2) AS reach_percentage
FROM gdb0120.fact_content
GROUP BY post_type
ORDER BY total_reach DESC;