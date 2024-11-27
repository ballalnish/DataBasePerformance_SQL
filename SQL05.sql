

--5. Find servers with inactive applications
--Objective: Identify servers hosting applications marked as inactive.


SELECT 
    s.server_name,
    s.location,
    a.app_name,
    a.status AS app_status
FROM 
    servers s
JOIN 
    applications a 
ON 
    s.server_id = a.server_id
WHERE 
    a.status = 'Inactive';
