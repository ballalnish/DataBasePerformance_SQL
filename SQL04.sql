

--4. Identify the top 3 applications with the highest CPU usage
--Objective: Get the top 3 applications with the highest average CPU usage.
SELECT 
    a.app_name,
    ROUND(AVG(CAST(p.cpu_usage AS NUMERIC)), 2) AS avg_cpu_usage
FROM 
    applications a
JOIN 
    performance_metric p 
ON 
    a.app_id = p.app_id
GROUP BY 
    a.app_name
ORDER BY 
    avg_cpu_usage DESC
LIMIT 3;
