alter database FlightEngine set single_user with rollback immediate;
restore database FlightEngine from disk='E:\tmp\FEfull.bak'
with replace,norecovery,
move 'FlightEngine_data' to 'G:\SqlData\FlightEngine.mdf',
move 'FlightEngine_data2' to 'G:\SqlData\FlightEngine_data2.ndf',
move 'FlightEngine_log' to 'G:\SQLData\FlighEngine.ldf';

restore database FlightEngine from disk='E:\tmp\FEdiff.bak'
with replace,
move 'FlightEngine_data' to 'G:\SqlData\FlightEngine.mdf',
move 'FlightEngine_data2' to 'G:\SqlData\FlightEngine_data2.ndf',
move 'FlightEngine_log' to 'G:\SQLData\FlighEngine.ldf';
alter database FlightEngine set multi_user;
use FlightEngine;
create user SearchFlightsAPI_test for login SearchFlightsAPI_test with default_schema=dbo;
ALTER ROLE [db_owner] ADD MEMBER [SearchFlightsAPI_test];


