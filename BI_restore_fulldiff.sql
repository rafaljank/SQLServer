alter database BI set single_user with rollback immediate;
restore database BI from disk='E:\tmp\BIfull.bak'
with replace,norecovery,
move 'BI_data' to 'G:\SqlData\BI.mdf',
move 'BI_log' to 'G:\SQLData\BI.ldf';

restore database BI from disk='E:\tmp\BIdiff.bak'
with replace,
move 'BI_data' to 'G:\SqlData\BI.mdf',
move 'BI_log' to 'G:\SQLData\BI.ldf';
alter database BI set multi_user;
