alter database OAuth set single_user with rollback immediate;
restore database OAuth from disk='E:\tmp\OAuthfull.bak'
with replace,
move 'Oauth' to 'G:\SqlData\Oauth.mdf',
move 'OAuth_log' to 'G:\SQLData\OAut_log.ldf';
alter database OAuth set multi_user;
