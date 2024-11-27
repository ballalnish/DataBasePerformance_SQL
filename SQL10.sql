

--10. Applications that have had the highest memory usage over the past week.


SELECT 
    a.app_name,
    MAX(p.memory_usage) AS max_memory_usage,
    COUNT(p.metric_timestamp) AS data_points
FROM 
    applications a
JOIN 
    performance_metric p ON a.app_id = p.app_id
GROUP BY 
    a.app_name
ORDER BY 
    max_memory_usage DESC
LIMIT 10;
