USE clique_bait;

/* 1 */
SELECT 
    COUNT(DISTINCT user_id)
FROM
    users;

/* 2 */
WITH cte AS
(
 SELECT user_id, COUNT(cookie_id) as cnt
 FROM users
 GROUP BY user_id
 )
SELECT ROUND(avg(cnt),2 ) as AVG_Cookie_Per_User FROM cte;

/* 3 */
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

/* 4 */
SELECT 
    e.event_type, ei.event_name, COUNT(e.visit_id)
FROM
    events e
        INNER JOIN
    event_identifier ei ON e.event_type = ei.event_type
GROUP BY e.event_type , ei.event_name;

/* 5 */

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

/* 6 */ 

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


/* 7 */

SELECT 
    p.page_name, COUNT(e.page_id) AS Num_of_visits
FROM
    events e
        INNER JOIN
    page_hierarchy p ON e.page_id = p.page_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;


/* 8 */

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











