alter database ContentApi set single_user with rollback immediate;
restore database ContentApi from disk='E:\tmp\ContentApifull.bak'
with replace,norecovery,
move 'ContentApi_data' to 'G:\SqlData\ContentApi.mdf',
move 'ContentApi_log' to 'G:\SQLData\ContentApi.ldf';

restore database ContentApi from disk='E:\tmp\ContentApidiff.bak'
with replace,
move 'ContentApi_data' to 'G:\SqlData\ContentApi.mdf',
move 'ContentApi_log' to 'G:\SQLData\ContentApi.ldf';
alter database ContentApi set multi_user;
