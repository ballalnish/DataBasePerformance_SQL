

--1. List all active servers and their applications
--Objective: Find servers marked as Active and the applications running on them.

SELECT 
    s.server_name,
    s.server_type,
    a.app_name,
    a.app_type
FROM 
    servers s
JOIN 
    applications a 
ON 
    s.server_id = a.server_id
WHERE 
    s.status = 'Active';
