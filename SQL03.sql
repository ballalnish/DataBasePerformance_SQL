

-- 3. Calculate average response time per application
-- 3. Determine the TOP 5 APPLICATION WHOS average response time IS MORE THAN THE COLLECTIVE AVERAGE RESPONSE TIME

-- Using a Common Table Expression (CTE)
WITH AvgResponseTime AS (
    SELECT 
        AVG(CAST(p.response_time AS NUMERIC)) AS collective_avg_response_time
    FROM 
        performance_metric p
)
SELECT 
    a.app_name,
    ROUND(AVG(CAST(p.response_time AS NUMERIC)), 2) AS avg_response_time,
   art.collective_avg_response_time
FROM 
    applications a
JOIN 
    performance_metric p ON a.app_id = p.app_id
CROSS JOIN 
    AvgResponseTime art
GROUP BY 
    a.app_name, art.collective_avg_response_time
HAVING 
    AVG(CAST(p.response_time AS NUMERIC)) > art.collective_avg_response_time
ORDER BY 
    avg_response_time DESC
	limit 5;
