

--12. Detect applications with zero error logs
--Objective: Find applications that have not generated any errors.

SELECT 
    a.app_name,
    a.app_type
FROM 
    applications a
LEFT JOIN 
    error_logs e 
ON 
    a.app_id = e.app_id
WHERE 
    e.error_TYPE IS NULL;
