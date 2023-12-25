CREATE DATABASE music;
use music;

create table MsBranch
(
	BranchID varchar(6) primary key,
    BrachName varchar(50) not null,
    Address varchar(100) not null,
    Phone varchar(20),
    Constraint CheckBranch1 Check (char_length(BranchID)=5),
    constraint CheckBranch2 check (BranchID regexp '^BR[0-9][0-9][0-9]$')
    );

create table MsMusicInsType
(
	MusicInsTypeID varchar(6) primary key,
    MusicInsType varchar(20) not null,
    constraint CheckMsct1 check (char_length(MusicInsTypeID)=5),
    constraint CheckMsct2 check (MusicInsTypeID regexp 'MT[0-9][0-9][0-9]')
);

drop table MsMusicInsType;

create table MsEmployee
(
	EmployeeID varchar(6) primary key, 
    EmployeeName varchar(50) not null,
    Address varchar(100) not null,
    Phone varchar(20), 
    Gender char(1) not null,
    DateOfBirth datetime,
    Salary decimal(10,2),
    BranchID varchar(6),
    constraint CheckEmpl1 check (char_length(EmployeeID)=5),
    constraint CheckEmpl2 check (EmployeeID regexp '^EM[0-9][0-9][0-9]$'),
    constraint CheckEmpl3 check (Gender in ('M', 'F')),
    constraint FK_MsEmployee_MsBranch foreign key (BranchID) references MsBranch(BranchID) on update cascade on delete set null
);


create table MsMusicIns
(
	MusicInsID varchar(6) primary key,
    MusicIns varchar(50) not null,
    Price Decimal(10,2) not null,
    Stock int not null,
    MusicInsTypeID varchar(6) references MusicInsType(MusicInsTypeID) on update cascade on delete set null,
    constraint CheckMsci1 check (char_length(MusicInsID)=5),
    constraint CheckMsci2 check (MusicInsID regexp 'MI[0-9][0-9][0-9]'),
    constraint CheckMsci3 check (Stock >= 0)
);

create table HeaderTransaction
(
	TransactionID varchar(6) primary key check (char_length(TransactionID)=5),
    TransactionDate datetime not null,
    EmployeeID varchar(6) references MsEmployee(EmployeeID) on update cascade on delete set null,
    CustomerName varchar(50),
    check (TransactionID regexp 'TR[0-9][0-9][0-9]')
);
    
create table DetailTransaction
(
	TransactionID varchar(6) references HeaderTransaction(TransactionID) on update cascade on delete cascade,
    MusicInsID varchar(6) references MsMusicIns(MusicInsID) on update cascade on delete cascade,
    Qyt int not null,
    primary key (TransactionID, MusicInsID)
);
