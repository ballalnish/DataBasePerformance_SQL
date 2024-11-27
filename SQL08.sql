

--8. Get servers with average CPU usage over 70%
--Objective: Identify servers whose applications have high average CPU usage.

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
HAVING 
    AVG(CAST(p.cpu_usage AS NUMERIC)) > 70
ORDER BY 
    avg_cpu_usage DESC;
