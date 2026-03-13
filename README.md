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

## Query 01 – Count Unique Post Types

### SQL Query

```sql
SELECT
COUNT(DISTINCT post_type) AS unique_post_types
FROM gdb0120.fact_content;
```
### Output

D:\SRI LALITHA\BUSINESS ANALYST\CODE BASICS BOOTCAMP 5.0\VIRTUAL INTERNSHIPS\VIRTUAL INTERNSHIP 2\WEEK 3 & 4\4.10\MY ASSIGNMENT\QUERY OUTPUTS SCREENSHOTS


