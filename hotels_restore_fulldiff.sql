alter database Hotels set single_user with rollback immediate;
restore database Hotels from disk='E:\tmp\Hotelsfull.bak'
with replace,norecovery,
move 'Hotels_data' to 'G:\SqlData\Hotels.mdf',
move 'Hotels_data2' to 'G:\SqlData\Hotels_data2.ndf',
move 'Hotels_log' to 'G:\SQLData\Hotels_log.ldf';

restore database Hotels from disk='E:\tmp\Hotelsdiff.bak'
with replace,
move 'Hotels_data' to 'G:\SqlData\Hotels.mdf',
move 'Hotels_data2' to 'G:\SqlData\Hotels_data2.ndf',
move 'Hotels_log' to 'G:\SQLData\Hotels_log.ldf';
alter database Hotels set multi_user;

