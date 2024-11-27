CREATE TABLE servers (
    server_id SERIAL PRIMARY KEY,
    server_name VARCHAR(255) NOT NULL,
    server_type VARCHAR(50) NOT NULL,
    location VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL
);

COPY servers(server_id, server_name, server_type, location, status)
FROM 'D:\NISHTHA\Portfolio Projects\SQL project\DB_Performance\servers.csv' DELIMITER ',' CSV HEADER;

select * from servers


CREATE TABLE applications (
    app_id varchar(50) PRIMARY KEY,
    app_name VARCHAR(255) NOT NULL,
    app_type VARCHAR(50) NOT NULL,
    server_id INT REFERENCES servers(server_id),
    status VARCHAR(50) NOT NULL
);

COPY applications(app_id, app_name, app_type, server_id, status)
FROM 'D:\NISHTHA\Portfolio Projects\SQL project\DB_Performance\applications.csv' DELIMITER ','
CSV HEADER;

select * from applications




CREATE TABLE error_logs (
    log_id VARCHAR(50) PRIMARY KEY,
    app_id varchar(50) REFERENCES applications(app_id),
    log_timestamp TIMESTAMP NOT NULL,
    error_type VARCHAR(50) NOT NULL,
    error_message TEXT NOT NULL
);

select * from ERROR_LOGS
COPY error_logs(log_id, app_id, log_timestamp,error_type,error_message )
FROM 'D:\NISHTHA\Portfolio Projects\SQL project\DB_Performance\error_log.csv'
DELIMITER ',' CSV HEADER;



CREATE TABLE performance_metric (
    metric_id varchar(50) PRIMARY KEY,
    app_id varchar(50) REFERENCES applications(app_id),
    metric_timestamp TIMESTAMP NOT NULL,
    cpu_usage VARCHAR(10) NOT NULL,
    memory_usage VARCHAR(10) NOT NULL,
    disk_io VARCHAR(20) NOT NULL,
    response_time VARCHAR(10) NOT NULL,
    status VARCHAR(50) NOT NULL
);

select * from performance_metric;
COPY performance_metric( metric_id,app_id,metric_timestamp,cpu_usage,
memory_usage ,disk_io,response_time,status)
FROM 'D:\NISHTHA\Portfolio Projects\SQL project\DB_Performance\performance_metric.csv'
DELIMITER ',' CSV HEADER;

UPDATE performance_metric
SET response_time = REGEXP_REPLACE(response_time, '[^\d.]+', '', 'g')
WHERE response_time ~ '[^\d.]+';

SELECT cpu_usage
FROM performance_metric
WHERE cpu_usage !~ '^\d+(\.\d+)?$'; -- This regex matches numeric values

