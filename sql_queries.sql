USE clique_bait;


/* Digital Analysis */
/* 1. How many users are there? */

SELECT 
    COUNT(DISTINCT user_id)
FROM
    users;


/* 2. How many cookies does each user have on average? */

WITH cte AS
(
 SELECT user_id, COUNT(cookie_id) as cnt
 FROM users
 GROUP BY user_id
 )
SELECT ROUND(avg(cnt),2 ) as AVG_Cookie_Per_User FROM cte;


/* 3. What is the unique number of visits by all users per month? */

SELECT 
    MONTH(e.event_time) AS Month_Num,
    MONTHNAME(e.event_time) AS Month_Name,
    COUNT(DISTINCT visit_id) AS tot_number_of_visits
FROM
    users u
        LEFT JOIN
    events e ON u.cookie_id = e.cookie_id
GROUP BY 1 , 2
ORDER BY 1;


/* 4. What is the number of events for each event type? */

SELECT 
    e.event_type, ei.event_name, COUNT(e.visit_id)
FROM
    events e
        INNER JOIN
    event_identifier ei ON e.event_type = ei.event_type
GROUP BY e.event_type , ei.event_name;


/* 5. What is the percentage of visits which have a purchase event? */

SELECT 
    ROUND(((SELECT 
                    COUNT(DISTINCT visit_id)
                FROM
                    events
                WHERE
                    event_type = 3) / (SELECT 
                    COUNT(DISTINCT visit_id)
                FROM
                    events
                WHERE
                    event_type = 1)) * 100,
            2) AS Purchase_percentage;


/* 6. What is the percentage of visits which view the checkout page but do not have a purchase event? */
 
WITH cte AS
(
SELECT 
CASE WHEN page_id = 12 THEN visit_id END as check_out,
Case WHEN event_type = 3 THEN visit_id END as pur
FROM events
)
SELECT COUNT(check_out) AS Total_viewed_checkout, 
	COUNT(pur) AS Total_purchased ,
    ROUND((COUNT(check_out) - COUNT(pur))/(COUNT(check_out))*100,2) as percentage 
    FROM cte;


/* 7. What are the top 3 pages by number of views? */

SELECT 
    p.page_name, COUNT(e.page_id) AS Num_of_visits
FROM
    events e
        INNER JOIN
    page_hierarchy p ON e.page_id = p.page_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;


/* 8. What is the number of views and cart adds for each product category? */

SELECT 
    p.product_category,
    COUNT(CASE
        WHEN e.event_type = 1 THEN e.visit_id
    END) AS pg_view,
    COUNT(CASE
        WHEN e.event_type = 2 THEN e.visit_id
    END) AS cart
FROM
    events e
        LEFT JOIN
    page_hierarchy p ON e.page_id = p.page_id
        LEFT JOIN
    event_identifier i ON e.event_type = i.event_type
WHERE
    p.product_category IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;


/* 9. What are the top 3 products by purchases? */

WITH cte AS (
  SELECT DISTINCT visit_id AS purchase_id
  FROM events 
  WHERE event_type = 3
),
cte2 AS (
  SELECT 
    p.page_name,
    p.page_id,
    e.visit_id 
  FROM events e
  LEFT JOIN page_hierarchy p ON p.page_id = e.page_id
  WHERE p.product_id IS NOT NULL 
    AND e.event_type = 2
)
SELECT 
  page_name as Product,
  COUNT(*) AS Quantity_Purchased
FROM cte 
LEFT JOIN cte2 ON visit_id = purchase_id 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3
;


/* Product Funnel Analysis */
/* Using a single SQL query - create a new output table which has the following details:

How many times was each product viewed?
How many times was each product added to cart?
How many times was each product added to a cart but not purchased (abandoned)?
How many times was each product purchased? */










