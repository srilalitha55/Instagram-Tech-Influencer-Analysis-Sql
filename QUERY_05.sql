WITH july_likes AS (
  SELECT
    fc.post_category,
    SUM(fc.likes) AS total_likes
  FROM gdb0120.fact_content fc
  JOIN gdb0120.dim_dates dd
    ON dd.date = fc.date
  WHERE dd.month_name = 'July'
  GROUP BY fc.post_category
)
SELECT
  post_category,
  total_likes
FROM july_likes
ORDER BY total_likes DESC;
