use music;

-- 1. Tampilkan top 2 dari EmployeeID, EmployeeName, Gender dimana Gender adalah 'F' 
-- (LIMIT)
select EmployeeID, EmployeeName, Gender
from msemployee
where gender = 'F'
limit 2;

-- 2. 	Tampilkan tabel MsEmployee dimana digit terakhir dari Phone adalah kelipatan 5 dan 
-- salary lebih besar dari 4000000 (RIGHT)
select * 
from msemployee
where right (phone,1) % 2 = 0 and salary > 400000;

-- 3.	Buatlah view dengan nama view_1 lalu tampilkan tabel MsMusicIns dimana price
-- antara 5000000 dan 10000000, dengan MusicIns diawali dengan kata Yamaha.
-- Tampilkan view tersebut dan buat syntax untuk menghapus view tersebut
-- (CREATE VIEW, BETWEEN, LIKE) 
create view view_1 as
select *
from MsMusicIns
where price between 500000 and 7000000 and MusicIns like 'Yamaha%';

select * from view_1;

-- 4.	Tampilkan BranchEmployee ( didapat dari employeename dan nama depan employeename diganti dengan branchID )
-- dimana employeename memiliki minimal 3 kata. (REPLACE, CONCAT, SUBSTRING, LOCATE, LIKE)

select concat_ws(' ', BranchID, substring(EmployeeName, locate(' ', EmployeeName)+1)) as BranchEmployee
from MsEmployee
where EmployeeName like '% % %';

select * from MsEmployee;

-- 5.	Tampilkan Brand (didapat dari kata pertama MusicIns), Price (didapat dari price ditambahkan kata 'Rp. ' didepannya),
-- Stock, Instrument Type(didapat dari MusicInsType) (SUBSTRING_INDEX,CONCAT, JOIN)

select substring_index(MusicIns,' ',1) as brand, concat('Rp.', Price) as Price, Stock, MusicInsType
from MsMusicIns as mi
join MsMusicInsType as mit on mit.MusicInsTypeID = mi.MusicInsTypeID;

-- 6.	Tampilkan EmployeeName, Employee Gender(didapat dari gender), Tanggal dengan format dd mm yyyy,
-- CustomerName, dimana Gender merupakan 'Male' dan EmployeeName memiliki 2 kata atau lebih.
-- (CASE WHEN, DATE_FORMAT, JOIN, LIKE, ORDER BY)
select EmployeeName, 
	   case 
		when Gender = 'F' then 'Female'
        else 'Male'
	   end as Gender,
	   date_format(TransactionDate, '%d %M %Y') as Tanggal, CustomerName
from MsEmployee as em
join HeaderTransaction as ht on ht.EmployeeID = em.EmployeeID
order by EmployeeName asc;

-- 7.	Tampilkan EmployeeID, EmployeeName, DateofBirth dengan format dd mm yyyy, CustomerName, Transactiondate dimana
-- DateOfBirth adalah bulan ‘December’ dan TransactionDate adalah tanggal 16. (DATE_FORMAT, JOIN, MONTHNAME, DAYOFMONTH)
select em.EmployeeID, em.EmployeeName, date_format(em.DateofBirth, '%d-%m-%Y') as DateOfBirth, 
		ht.CustomerName, ht.TransactionDate
from MsEmployee as em
join HeaderTransaction as ht on ht.EmployeeID = em.EmployeeID
where monthname(DateOfBirth) = 'April' and dayofmonth(TransactionDate) = 02;
select * from MsEmployee;
select * from HeaderTransaction;

-- 8.	Tampilkan BranchName,EmployeeName dimana transaksi terjadi bulan Oktober dan Qty lebih dari sama dengan 5.
-- (EXISTS, JOIN, MONTHNAME) 
select BrachName, EmployeeName
from MsEmployee as em
join MsBranch as br on br.BranchID = em.BranchID
join HeaderTransaction as ht on ht.EmployeeID = em.EmployeeID
join DetailTransaction as dt on dt.TransactionID = ht.TransactionID
where monthname(TransactionDate) = 'October' and qty >= 2;

-- pake subquery
select BrachName, EmployeeName
from MsEmployee as em
join MsBranch as br on br.BranchID = em.BranchID
where exists (
	select * 
    from HeaderTransaction as ht
    join DetailTransaction as dt on dt.TransactionID = ht.TransactionID
    where monthname(TransactionDate) = 'October' and qty >= 2 and em.EmployeeID = ht.EmployeeID
    );