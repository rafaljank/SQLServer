alter database VanApi set single_user with rollback immediate;
restore database VanApi from disk='E:\tmp\VanApifull.bak'
with replace,
move 'VanApi' to 'G:\SqlData\VanApi.mdf',
move 'VanApi_log' to 'G:\SQLData\VanApi.ldf';
alter database VanApi set multi_user;
