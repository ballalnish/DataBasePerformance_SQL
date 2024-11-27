

--6. Count the total number of error logs by type
--Objective: Summarize the number of errors by their type.
SELECT 
    e.error_type,
    COUNT(e.error_TYPE) AS total_errors
FROM 
    error_logs e
GROUP BY 
    e.error_type
ORDER BY 
    total_errors DESC;
