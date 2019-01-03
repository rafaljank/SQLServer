alter database AdvancePurchaseDateCalc set single_user with rollback immediate;
restore database AdvancePurchaseDateCalc from disk='E:\tmp\AdvancePurchaseDateCalcfull.bak'
with replace,norecovery,
move 'AdvancePurchaseDateCalc_data' to 'G:\SqlData\AdvancePurchaseDateCalc.mdf',
move 'AdvancePurchaseDateCalc_log' to 'G:\SQLData\AdvancePurchaseDateCalc.ldf';

restore database AdvancePurchaseDateCalc from disk='E:\tmp\AdvancePurchaseDateCalcdiff.bak'
with replace,
move 'AdvancePurchaseDateCalc_data' to 'G:\SqlData\AdvancePurchaseDateCalc.mdf',
move 'AdvancePurchaseDateCalc_log' to 'G:\SQLData\AdvancePurchaseDateCalc.ldf';
alter database AdvancePurchaseDateCalc set multi_user;
