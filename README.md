# Instagram Tech Influencer Analysis (SQL)
This project was completed as part of the Codebasics Virtual Internship.

## Objective
Analyze Instagram influencer performance data using SQL to derive insights on reach, engagement, impressions, and follower growth.

## Files Included
- sql_questions.pdf → Assignment questions

- QUERY_01.sql to QUERY_10.sql → SQL solutions

- Q1_output.csv to Q10_output.csv → Query results (outputs)

## Key Analysis
- Unique post types identification

- Highest & lowest impressions by content format

- Weekend posting analysis

- Monthly profile visits & follower growth

- Post category engagement analysis

- Reach percentage by post type

- Quarterly engagement trends

- Share behaviour analysis

## Tools Used
- MySQL

- SQL

## Question 01 – How many unique post types are found in the 'fact_content' table?

### SQL Query

```sql
SELECT
COUNT(DISTINCT post_type) AS unique_post_types
FROM gdb0120.fact_content;
```
### Output

![Question 01 Output](OUTPUTS/OUTPUT_01.png)

## Question 02 – What are the highest and lowest recorded impressions for each post type? 

### SQL Query

```sql
  SELECT
  post_type,
  MAX(impressions) AS highest_impressions,
  MIN(impressions) AS lowest_impressions
  FROM gdb0120.fact_content
  GROUP BY post_type
  ORDER BY post_type;
```
### Output

![Question 02 Output](OUTPUTS/OUTPUT_02.png)

## Question 03 – Filter all the posts that were published on a weekend in the month of March and April and export them to a separate csv file.

### SQL Query

```sql
SELECT fc.*
FROM gdb0120.fact_content fc 
JOIN gdb0120.dim_dates dd ON dd.date = fc.date 
WHERE dd.weekday_or_weekend = 'Weekend' 
AND dd.month_name IN ('March', 'April') 
ORDER BY fc.date, fc.post_type;

SELECT fc.*
FROM gdb0120.fact_content fc 
JOIN gdb0120.dim_dates dd ON dd.date = fc.date 
WHERE dd.weekday_or_weekend = 'Weekend' 
AND dd.month_name IN ('March', 'April')
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weekend_posts_mar_apr.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```
### Output

![Question 03 Output](OUTPUTS/OUTPUT_03.png)

## Question 04 – Create a report to get the statistics for the account. The final output includes the following fields: 

• month_name 

• total_profile_visits 

• total_new_followers

### SQL Query

```sql
  SELECT
  dd.month_name,
  SUM(fa.profile_visits) AS total_profile_visits,
  SUM(fa.new_followers)  AS total_new_followers
  FROM gdb0120.fact_account fa
  JOIN gdb0120.dim_dates dd
  ON dd.date = fa.date
  GROUP BY dd.month_name
  ORDER BY MIN(dd.date);
```
### Output

![Question 04 Output](OUTPUTS/OUTPUT_04.png)

## Question 05 – Write a CTE that calculates the total number of 'likes’ for each 'post_category' during the month of 'July' and subsequently, arrange the 'post_category' values in descending order according to their total likes.

### SQL Query

```sql
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
```
### Output

![Question 05 Output](OUTPUTS/OUTPUT_05.png)

## Question 06 – Create a report that displays the unique post_category names alongside their respective counts for each month. The output should have three columns:  

• month_name 

• post_category_names  

• post_category_count 

Example:  

• 'April', 'Earphone,Laptop,Mobile,Other Gadgets,Smartwatch', '5' 

• 'February', 'Earphone,Laptop,Mobile,Smartwatch', '4' 

### SQL Query

```sql
  SELECT
  dd.month_name,
  GROUP_CONCAT(DISTINCT fc.post_category ORDER BY fc.post_category SEPARATOR ',') AS post_category_names,
  COUNT(DISTINCT fc.post_category) AS post_category_count
  FROM gdb0120.fact_content fc
  JOIN gdb0120.dim_dates dd
  ON dd.date = fc.date
  GROUP BY dd.month_name
  ORDER BY MIN(dd.date);
```
### Output

![Question 06 Output](OUTPUTS/OUTPUT_06.png)



