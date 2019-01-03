alter database ContentApi set single_user with rollback immediate;
restore database ContentApi from disk='E:\tmp\ContentApifull.bak'
with replace,
move 'ContentApi_data' to 'G:\SqlData\ContentApi.mdf',
move 'ContentApi_log' to 'G:\SQLData\ContentApi.ldf';
alter database ContentApi set multi_user;
