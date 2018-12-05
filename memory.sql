dbcc memorystatus;

SELECT pool_id,
	memory_broker_type,
	allocations_kb,
	allocations_kb_per_sec,
	predicted_allocations_kb,
	target_allocations_kb,
	future_allocations_kb,
	overall_limit_kb,
	last_notification
FROM sys.dm_os_memory_brokers;

SELECT physical_memory_in_use_kb AS Actual_Usage,
	large_page_allocations_kb AS large_Pages,
	locked_page_allocations_kb AS locked_Pages,
	virtual_address_space_committed_kb AS VAS_Committed,
	large_page_allocations_kb + locked_page_allocations_kb + 427000
FROM sys.dm_os_process_memory;

SELECT type, SUM(pages_in_bytes)
FROM sys.dm_os_memory_objects
GROUP BY type
ORDER BY 2 DESC;


SELECT type,
	 name,
	 max_free_entries_count,
	 free_entries_count,
	 removed_in_all_rounds_count
FROM sys.dm_os_memory_pools
ORDER BY removed_in_all_rounds_count DESC

SELECT type,
	 name,
	 max_free_entries_count,
	 free_entries_count,
	 removed_in_all_rounds_count
FROM sys.dm_os_memory_pools
ORDER BY removed_in_all_rounds_count DESC


SELECT physical_memory_kb,
	committed_kb
FROM sys.dm_os_sys_info;

SELECT name,
	type,
	SUM(pages_kb) AS Size,
	SUM(pages_in_use_kb) AS Used_Size,
	SUM(entries_count) AS Entries,
	SUM(entries_in_use_count) AS Used_Entries
FROM sys.dm_os_memory_cache_counters
GROUP BY name, type
ORDER BY 4 DESC;
