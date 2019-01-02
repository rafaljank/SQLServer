alter database DBA set single_user with rollback immediate;
restore database DBA from disk='E:\tmp\DBAfull.bak'
with replace,norecovery,
move 'DBA_data' to 'G:\SqlData\DBA.mdf',
move 'DBA_log' to 'G:\SQLData\DBA.ldf';

restore database DBA from disk='E:\tmp\DBAdiff.bak'
with replace,
move 'DBA_data' to 'G:\SqlData\DBA.mdf',
move 'DBA_log' to 'G:\SQLData\DBA.ldf';
alter database DBA set multi_user;
