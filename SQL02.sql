

--2. Find applications with the highest number of error logs
--Objective: Identify which application generates the most error logs.

SELECT 
    a.app_name,
    COUNT(e.error_id) AS error_count
FROM 
    applications a
LEFT JOIN 
    error_logs e 
ON 
    a.app_id = e.app_id
GROUP BY 
    a.app_name
ORDER BY 
    error_count DESC
LIMIT 1;
