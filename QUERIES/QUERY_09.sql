WITH ranked AS (
  SELECT
    dd.month_name AS month,
    fa.date,
    fa.new_followers,
    ROW_NUMBER() OVER (
      PARTITION BY dd.month_name
      ORDER BY fa.new_followers DESC, fa.date
    ) AS rn
  FROM gdb0120.fact_account fa
  JOIN gdb0120.dim_dates dd
    ON dd.date = fa.date
)
SELECT
  month,
  date,
  new_followers
FROM ranked
WHERE rn <= 3
ORDER BY MIN(date) OVER (PARTITION BY month), rn;
