alter database Adverts set single_user with rollback immediate;
restore database Adverts from disk='E:\tmp\Advertsfull.bak'
with replace,norecovery,
move 'Adverts' to 'G:\SqlData\Adverts.mdf',
move 'Adverts_log' to 'G:\SQLData\Adverts.ldf';

restore database Adverts from disk='E:\tmp\Advertsdiff.bak'
with replace,
move 'Adverts' to 'G:\SqlData\Adverts.mdf',
move 'Adverts_log' to 'G:\SQLData\Adverts.ldf';
alter database Adverts set multi_user;
