

--9. List applications with increasing response times over time
--Objective: Detect applications showing performance degradation.


WITH response_data AS (
    SELECT 
        a.app_name,
        p.response_time,
        LAG(p.response_time) OVER (PARTITION BY a.app_name ORDER BY p.metric_timestamp) AS previous_response_time
    FROM 
        applications a
    JOIN 
        performance_metric p ON a.app_id = p.app_id
)
SELECT *
FROM response_data
WHERE 
    response_time > previous_response_time
ORDER BY 
    response_time DESC;
