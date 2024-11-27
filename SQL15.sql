

--15. Analyze server distribution across locations
--Objective: Count the number of servers in each location.

SELECT 
    s.location,
    COUNT(s.server_id) AS server_count
FROM 
    servers s
GROUP BY 
    s.location
ORDER BY 
    server_count DESC;
