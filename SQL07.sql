

--7. Identify applications with a high error rate
-- Objective: Find applications with more than 5 errors logged.


SELECT 
    a.app_name,
    COUNT(e.error_type) AS error_count
FROM 
    applications a
JOIN 
    error_logs e 
ON 
    a.app_id = e.app_id
GROUP BY 
    a.app_name
HAVING 
    COUNT(e.error_type) >4
ORDER BY 
    error_count DESC;

