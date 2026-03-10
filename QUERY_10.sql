DROP PROCEDURE IF EXISTS gdb0120.get_total_shares_by_post_type_for_week;
DELIMITER $$

CREATE PROCEDURE gdb0120.get_total_shares_by_post_type_for_week(IN p_week_no VARCHAR(10))
BEGIN
  SELECT
    fc.post_type,
    SUM(fc.shares) AS total_shares
  FROM gdb0120.fact_content fc
  JOIN gdb0120.dim_dates dd
    ON dd.date = fc.date
  WHERE dd.week_no = p_week_no
  GROUP BY fc.post_type
  ORDER BY total_shares DESC;
END $$

DELIMITER ;

CALL gdb0120.get_total_shares_by_post_type_for_week('W1');