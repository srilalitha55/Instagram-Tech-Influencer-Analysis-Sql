SELECT
  fc.post_category,
  CASE
    WHEN dd.month_name IN ('January','February','March') THEN 'Q1'
    WHEN dd.month_name IN ('April','May','June')        THEN 'Q2'
    WHEN dd.month_name IN ('July','August','September') THEN 'Q3'
    ELSE 'Other'
  END AS quarter,
  SUM(fc.comments) AS total_comments,
  SUM(fc.saves)    AS total_saves
FROM gdb0120.fact_content fc
JOIN gdb0120.dim_dates dd
  ON dd.date = fc.date
GROUP BY fc.post_category, quarter
ORDER BY fc.post_category, quarter;