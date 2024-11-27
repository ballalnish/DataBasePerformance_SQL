

--11. Find the server with the most diverse applications
--Objective: Identify the server hosting the highest number of unique application types.

SELECT 
    s.server_name,
    COUNT(DISTINCT a.app_type) AS unique_app_types
FROM 
    servers s
JOIN 
    applications a 
ON 
    s.server_id = a.server_id
GROUP BY 
    s.server_name
ORDER BY 
    unique_app_types DESC
LIMIT 1;
