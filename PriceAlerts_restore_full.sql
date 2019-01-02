alter database PriceAlerts set single_user with rollback immediate;
restore database PriceAlerts from disk='E:\tmp\PriceAlertsfull.bak'
with replace,
move 'PriceAlerts_data' to 'G:\SqlData\PriceAlerts.mdf',
move 'PriceAlerts_log' to 'G:\SQLData\PriceAlerts.ldf';
alter database PriceAlerts set multi_user;
