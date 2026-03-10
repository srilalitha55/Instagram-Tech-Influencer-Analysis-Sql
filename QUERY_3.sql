SELECT
  fc.*
FROM gdb0120.fact_content fc
JOIN gdb0120.dim_dates dd
  ON dd.date = fc.date
WHERE dd.weekday_or_weekend = 'Weekend'
  AND dd.month_name IN ('March', 'April')
ORDER BY fc.date, fc.post_type;

SELECT
  fc.*
FROM gdb0120.fact_content fc
JOIN gdb0120.dim_dates dd
  ON dd.date = fc.date
WHERE dd.weekday_or_weekend = 'Weekend'
  AND dd.month_name IN ('March', 'April')
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weekend_posts_mar_apr.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';