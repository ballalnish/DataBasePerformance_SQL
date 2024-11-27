

--13. Identify error-prone time periods
--Objective: Detect the time periods with the highest number of errors.

SELECT 
    DATE_TRUNC('hour', e.log_timestamp) AS error_time,
    COUNT(e.error_TYPE) AS error_count
FROM 
    error_logs e
GROUP BY 
    error_time
ORDER BY 
    error_count DESC
LIMIT 10;
