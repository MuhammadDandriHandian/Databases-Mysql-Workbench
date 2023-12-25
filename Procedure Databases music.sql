use music;

-- 9.	Buatlah store procedure untuk fungsi search dengan nama search yang menampilkan EmployeeName,
-- Address, Phone, Gender. Fungsi ini akan mencari ke seluruh kolom sesuai inputan. (CREATE PROCEDURE, LIKE, CONCAT)
delimiter $$  -- untuk mengubah dari ; menjadi $$. Harus diubah lagi nanti ke ;
create procedure serch (in input varchar(255))
begin
	select EmployeeName, Address, Phone, Gender
    from MsEmployee
    where EmployeeName like concat('%', input, '%')
	or Address like concat ('%', input, '%')
    or Phone like concat ('%', input, '%')
    or Gender like concat ('%', input, '%');
end $$

delimiter ;			-- ini udah diubah

call serch('dan');

-- 10.	Buatlah Stored Procedure dengan nama “Check_Transaction” yang menampilkan data CustomerName,
-- EmployeeName, BranchName, MusicIns, Price berdasarkan TransactionID yang diinput.
Delimiter $$
create procedure CheckTransaction (in input varchar(255))
begin
	select CustomerName, EmployeeName, BrachName, MusicIns, Price
    from headertransaction as ht
    join msemployee as em on em.EmployeeID = ht.EmployeeID
    join msbranch as b on b.BranchID = em.BranchID
    join detailtransaction as dt on dt.TransactionID = ht.TransactionID
    join msmusicins as mi on mi.MusicInsID = dt.MusicInsID
    where dt.TransactionID like input;
end $$

delimiter ;

drop procedure CheckTransaction;
select * from detailtransaction;
call CheckTransaction('TR001');

-- 11.	Tampilkan data yang menunjukan detail jumlah transaksi musicins per employee
-- JumlahTransaksi, EmployeeName

select count(ht.TransactionID) as JumlahTransaksi, em.EmployeeName
from Headertransaction as ht
join msemployee as em on em.EmployeeID = ht.EmployeeID
group by em.EmployeeName
order by JumlahTransaksi desc;

select * from headertransaction;

-- 12.	Buatlah Stored Procedure dengan nama "Add_Stock_MusicIns" untuk menambah stock MusicIns.
-- Jika stock yang diinput lebih kecil atau sama dengan 0, maka akan dimunculkan pesan
-- "Stok yang di input harus lebih besar dari 0"

delimiter $$
create procedure AddStockMusicIns (in inputID varchar(10), inputStock int)
begin
	if exists (select * from msmusicins where MusicInsID = inputID) then
			if inputStock <= 0 then
				select 'Harus lebih dari nol';
			else 
				update msmusicins set Stock = Stock + inputStock where MusicInsID = inputID;
			end if;
	else 	
		select 'Data yg diinputkan salah/tidak ada';
	end if;
end $$

delimiter ;

call AddStockMusicIns ('MI001',5);
select * from MsMusicIns;

-- 13. Buatlah Stored Procedure dengan nama “Check_Sale” untuk melihat MusicInsType
-- apa saja yang terjual pada bulan tertentu beserta jumlah yang terjualnya.

delimiter $$
create procedure CheckSale (in inputBulan varchar(56))
begin
	select mit.MusicInsType, sum(dt.qty) as Qty
    from MsMusicInsType as mit
    join MsMusicIns as mi on mi.MusicInsTypeID = mit.MusicInsTypeID
    join DetailTransaction as dt on dt.MusicInsID = mi.MusicInsID
    join HeaderTransaction as ht on ht.TransactionID = dt.TransactionID
    where monthname(TransactionDate) = inputBulan
    group by mit.MusicInsType;
end $$

delimiter ;

drop procedure CheckSale;
call CheckSale('January');


-- 14.	Buatlah Stored Procedured dengan nama “Check_Employee”
-- yang berfungsi untuk memberikan informasi employeename, address, phone,
-- DateOfBirth, dan BranchName berdasarkan TransactionID. Jika TransactionID
-- tidak dimasukan, maka akan dimunculkan semua data employee yang ada.

DELIMITER $$

CREATE PROCEDURE Check_Employee(IN input VARCHAR(255))
BEGIN
	IF input != '' THEN
		SELECT a.EmployeeName, a.Address, a.Phone, DATE_FORMAT(a.DateOfBirth, '%d %M %Y') AS DateOfBirth, b.BrachName
		FROM MsEmployee a
		JOIN MsBranch b ON a.BranchID = b.BranchID
		JOIN HeaderTransaction c ON a.EmployeeID = c.EmployeeID
		WHERE c.TransactionID = input;
	ELSE
		SELECT a.EmployeeName, a.Address, a.Phone, DATE_FORMAT(a.DateOfBirth, '%d %M %Y') AS DateOfBirth, b.BrachName
		FROM MsEmployee a
		JOIN MsBranch b ON a.BranchID = b.BranchID;
	END IF;
END$$

DELIMITER ;

drop procedure Check_Employee;
CALL Check_Employee("TR001");




