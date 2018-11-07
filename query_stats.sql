SELECT
    max_logical_writes, total_logical_writes, last_logical_writes,
    execution_count, QueryString
FROM sys.dm_exec_query_stats 
CROSS APPLY (SELECT SUBSTRING(text, statement_start_offset/2 + 1,
        (CASE WHEN statement_end_offset = -1 
            THEN LEN(CONVERT(nvarchar(MAX),text)) * 2 
                ELSE statement_end_offset 
            END - statement_start_offset)/2 + 1) AS QueryString
     FROM sys.dm_exec_sql_text(sql_handle)
    ) AS query_text
ORDER BY total_logical_writes DESC;
