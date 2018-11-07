SELECT * FROM sys.dm_os_performance_counters
WHERE counter_name LIKE 'buffer%';

SELECT objects.name AS "Object Name", objects.type_desc AS "Object Type",
	COUNT(*) AS "Total Buffer Pages"
FROM sys.dm_os_buffer_descriptors
	INNER JOIN sys.allocation_units
	ON allocation_units.allocation_unit_id = dm_os_buffer_descriptors.allocation_unit_id
		INNER JOIN sys.partitions
		ON ((allocation_units.container_id = partitions.hobt_id AND type IN (1,3))
			OR (allocation_units.container_id = partitions.partition_id AND type IN (2)))
			INNER JOIN sys.objects
			ON partitions.object_id = objects.object_id
WHERE allocation_units.type IN (1,2,3)
AND objects.is_ms_shipped = 0
AND dm_os_buffer_descriptors.database_id = DB_ID()
GROUP BY objects.name, objects.type_desc
ORDER BY COUNT(*) DESC;

