select * from MsBranch;
select * from msemployee;
select * from msmusicinstype;
select * from msmusicins;
select * from headertransaction;
select * from detailtransaction;



insert into MsBranch values ('BR001', 'Cabang Grogol', 'Jl Poglar 02', '087728368451');
insert into MsBranch values ('BR002', 'Cabang Pesing', 'Jl Daan Mogot 1', '087820328481');
insert into MsBranch values ('BR003', 'Cabang Cianjur', 'Perum Pondok Indah C.24', '0263-267324');

insert into msemployee values ('EM001', 'Dandri Handian', 'Perum Pondok Indah', '08729374927', 'M', '2000-05-26', '8500000', 'BR003');
insert into msemployee values ('EM002', 'Ari Nugraha', 'Gadung Permai', '08723938383', 'M', '2001-02-16', '6500000', 'BR002');
insert into msemployee values ('EM003', 'Salsadila', 'Grogol', '0879374638', 'F', '2002-04-02', '6000000', 'BR001');
insert into msemployee values ('EM004', 'Sofa Sarah', 'Bandung Timur', '08837283947', 'F', '2000-05-05', '7000000', 'BR003');

insert into MsMusicInsType values ('MT001','Guitar');
insert into MsMusicInsType values ('MT002','Violin');
insert into MsMusicInsType values ('MT003','Piano');
insert into MsMusicInsType values ('MT004','Drum');
insert into MsMusicInsType values ('MT005','Keyboard');

insert into MsMusicIns values ('MI001','Yamaha CX-40','1150000','23','MT001');
insert into MsMusicIns values ('MI002','Yamaha KX-5000','5950000','12','MT005');
insert into MsMusicIns values ('MI003','Yamaha C-390','1250000','10','MT001');
insert into MsMusicIns values ('MI004','Excellent P-77','25700000','17','MT003');
insert into MsMusicIns values ('MI005','Board B-123','5650000','30','MT005');
insert into MsMusicIns values ('MI006','Pearl Q-300','9570000','26','MT004');
insert into MsMusicIns values ('MI007','Supernova X-23','4510000','56','MT002');
insert into MsMusicIns values ('MI008','Yamaha Grand X-1','49750000','12','MT003');

insert into HeaderTransaction values ('TR001','2010-10-02 15:30:00.000','EM003','Veronica');
insert into HeaderTransaction values ('TR002','2010-10-15 09:50:00.000','EM008','Richard Parker');
insert into HeaderTransaction values ('TR003','2010-10-16 13:26:00.000','EM005','Steven Michael');
insert into HeaderTransaction values ('TR004','2010-11-22 10:55:00.000','EM004','Anabelle Setiawan Wati');
insert into HeaderTransaction values ('TR005','2010-11-25 15:30:00.000','EM003','Michelle Regina');
insert into HeaderTransaction values ('TR006','2010-12-13 08:23:00.000','EM001','Dian Sastro');
insert into HeaderTransaction values ('TR007','2010-12-13 18:19:00.000','EM001','Cathy');
insert into HeaderTransaction values ('TR008','2010-12-27 15:21:00.000','EM006','Stephanie Meyer');
insert into HeaderTransaction values ('TR009','2010-01-02 10:28:00.000','EM007','Michael J.');
insert into HeaderTransaction values ('TR010','2010-01-03 12:39:00.000','EM002','Arnold Swasana Segar');

insert into DetailTransaction values ('TR001','MI001','1');
insert into DetailTransaction values ('TR001','MI004','2');
insert into DetailTransaction values ('TR002','MI003','1');
insert into DetailTransaction values ('TR002','MI005','2');
insert into DetailTransaction values ('TR002','MI008','5');
insert into DetailTransaction values ('TR003','MI007','4');
insert into DetailTransaction values ('TR004','MI004','3');
insert into DetailTransaction values ('TR004','MI006','3');
insert into DetailTransaction values ('TR005','MI002','1');
insert into DetailTransaction values ('TR006','MI001','2');
insert into DetailTransaction values ('TR007','MI003','3');
insert into DetailTransaction values ('TR007','MI006','5');
insert into DetailTransaction values ('TR008','MI002','3');
insert into DetailTransaction values ('TR008','MI004','2');
insert into DetailTransaction values ('TR008','MI008','1');
insert into DetailTransaction values ('TR009','MI002','2');
insert into DetailTransaction values ('TR009','MI005','4');
insert into DetailTransaction values ('TR010','MI001','2');
insert into DetailTransaction values ('TR010','MI003','2');
insert into DetailTransaction values ('TR010','MI004','2');
insert into DetailTransaction values ('TR011','MI004','1');
insert into DetailTransaction values ('TR011','MI005','1');

SELECT MusicInsTypeID, MusicIns FROM MsMusicIns;
SELECT MusicInsID, Qty FROM DetailTransaction WHERE TransactionID = 'TR011';

UPDATE DetailTransaction 
SET Qty = 3
WHERE TransactionID = 'TR011' AND MusicInsID = 'MI005';

UPDATE DetailTransaction 
SET Qty = 5
WHERE TransactionID = 'TR011';

DELETE FROM DetailTransaction WHERE TransactionID = 'TR011'; 

UPDATE DetailTransaction SET QTY = 5;

DELETE FROM DetailTransaction; 


