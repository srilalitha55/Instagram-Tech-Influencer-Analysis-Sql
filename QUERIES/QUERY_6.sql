SELECT
  dd.month_name,
  GROUP_CONCAT(DISTINCT fc.post_category ORDER BY fc.post_category SEPARATOR ',') AS post_category_names,
  COUNT(DISTINCT fc.post_category) AS post_category_count
FROM gdb0120.fact_content fc
JOIN gdb0120.dim_dates dd
  ON dd.date = fc.date
GROUP BY dd.month_name
ORDER BY MIN(dd.date);