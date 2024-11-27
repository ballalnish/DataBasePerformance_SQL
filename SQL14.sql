

--14. Aggregate memory usage by application type
--Objective: Summarize memory usage for each application type.

SELECT 
    a.app_name,
    ROUND(SUM(CAST(p.memory_usage AS NUMERIC)), 2) AS total_memory_usage
FROM 
    applications a
JOIN 
    performance_metric p ON a.app_id = p.app_id
GROUP BY 
    a.app_name
ORDER BY 
    total_memory_usage DESC;
