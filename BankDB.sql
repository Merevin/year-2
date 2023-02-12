CREATE DATABASE IF NOT EXISTS `BankDB`;

Use BankDB;

CREATE TABLE `Accounts` (
	`AccountID` int(8) NOT NULL AUTO_INCREMENT,
	`CustomerID` varchar(250) NOT NULL,
    `Sort_code` int(6)  NOT NULL,
    `Open_balance` int(250) NOT NULL,
    PRIMARY KEY (`AccountID`),
	KEY `AccountID` (`AccountID`),
    KEY `CustomerID` (`CustomerID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `Customer` (
	`CustomerID` varchar(250) NOT NULL,
    `Fullname` varchar(250) NOT NULL,
	`Phone` varchar(25) NOT NULL,
	`Address` varchar(250) NOT NULL,
	`DofB` date NOT NULL,
    PRIMARY KEY (`CustomerID`),
    KEY `CustomerID` (`CustomerID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE `Transactions` (
	`TransactionID` int(8) NOT NULL AUTO_INCREMENT,
	`AccountID` int(8) NOT NULL,
    `Description` varchar(250) not NULL,
    `Amount` int(250) NOT NULL,
	`Date` date NOT NULL,
    PRIMARY KEY (`TransactionID`),
    KEY `TransactionID` (`TransactionID`),
	KEY `AccountID` (`AccountID`)
    
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE `Loans` (
	`LoanID` int(8) NOT NULL AUTO_INCREMENT,
	`AccountID` int(8) NOT NULL,
    `Paypermonth` int(250) NOT NULL,
    `Numbermonths` int(4) NOT NULL,
	`Firstmonth` date  NOT NULL,
	`Dayofpay` int(2)  NOT NULL,
    PRIMARY KEY (`LoanID`),
	KEY `LoanID` (`LoanID`),
	KEY `AccountID` (`AccountID`)
    
    
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `Loans`
ADD CONSTRAINT FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Accounts`
ADD CONSTRAINT FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Transactions`
ADD CONSTRAINT FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE;
	
INSERT INTO `Customer` (`CustomerID`, `Fullname`,`Phone`, `Address`,`DofB`) VALUES
	('GL1',	'Grayson Lang',		'(223) 870-0956',	'36 Doverdale Avenue, Kidderminster,DY10 3BS','1999-10-19'),
	('JM1',	'Jacqueline Macias','(391) 983-9392',	'West Wylam Colliery Post Office, Prudhoe,NE42 5HT','2002-04-16'),
	('MM1',	'Moises Moody',		'(472) 456-6965',	'15 Park Road, Werrington,ST9 0EB',			'1997-04-02'),
	('AS1',	'Abigayle Schneider','(659) 311-1888',	'1 The Limes, Duffield,DE56 4AX',			'1982-06-07'),
	('IR1',	'Isla Randolph',	'(201) 668-5326',	'22 - 24 Corporation Street, Chesterfield,S41 7TP',	'2000-07-20'),
	('UB1',	'Uriah Brooks',		'(680) 661-4535',	'10 Seascale Park, Seascale,CA20 1HD',		'1994-06-17'),
	('FF1',	'Finnegan Francis',	'(938) 609-9039',	'10 Station Gardens, Swaffham,PE37 7LF',	'1997-07-22'),
	('KL1',	'Kyson Lozano',		'(208) 315-2053',	'12 Swallow Close, Chapel St Leonards,PE24 5RW','1981-07-04'),
	('JD1',	'Jadyn Donaldson',	'(800) 379-5974',	'30 Warton Road, Basingstoke,RG21 5HL',		'1995-11-18'),
	('EH1',	'Eliezer Hayes',	'(462) 888-0974',	'21 Montfort Street, Evesham,WR11 3BY',		'1997-03-02'),
	('JM2',	'Juliette Malone',	'(835) 663-2498',	'14A Hall Villa Lane, Toll Bar,DN5 0LH',	'1988-01-09'),
	('HB1',	'Hugo Burch',		'(347) 329-9554',	'16 Mayfield Road, Burton-On-Trent,DE15 0JT','1984-03-20'),
	('JT1',	'Jaylene Tanner',	'(328) 864-1741',	'Drill Hall Cottage, Edwin Street, Houghton Le Spring,DH5 8BH',	'1996-06-19'),
	('IJ1',	'Ivan James',		'(717) 377-5028',	'42 Chestnut Avenue, Dogsthorpe,PE1 4JB',	'1984-12-05'),
	('RB1',	'Rigoberto Boone',	'(521) 675-4082',	'4 Emberwood, Crawley,RH11 7QT',			'1990-09-14');


INSERT INTO `Accounts` (`AccountID`, `CustomerID`,`Sort_code`, `Open_balance`) VALUES
	(1,	'GL1',	143548,	150),
	(2,	'JM1',	143548,	650),
	(3,	'MM1',	143548,	450),
	(4,	'AS1',	143548,	350),
	(5,	'IR1',	143548,	3500),
	(6,	'UB1',	143548,	10000),
	(7,	'FF1',	143548,	8000),
	(8,	'KL1',	143548,	5000),
	(9,	'JD1',	143548,	3400),
	(10,'EH1',	143548,9000),
	(11,'JM2',	143548,	300),
	(12,'HB1',	143548,	250),
	(13,'JT1',	143548,	340),
	(14,'IJ1',	143548,	600),
	(15,'RB1',	143548,	120);
	
INSERT INTO `Loans` (`LoanID`, `AccountID`,`Paypermonth`, `Numbermonths`,`Firstmonth`,`Dayofpay`) VALUES
	(1,	12,	200,	24,	'2022-06-05',	5),
	(2,	8,	300,	48,	'2021-03-13',	13),
	(3,	5,	500,	12,	'2022-03-20',	20),
	(4,	8,	100,	18,	'2022-03-17',	17),
	(5,	6,	350,	36,	'2022-03-05',	15),
	(6,	6,	150,	12,	'2022-04-16',	24);
	
INSERT INTO `Transactions` (`TransactionID`, `AccountID`,`Description`, `Amount`,`Date`) VALUES
	(1,	1,	'work',		100,	'2023-01-28'),
	(2,	2,	'deliveroo',-50,	'2023-01-28'),
	(3,	3,	'just-eat',	150,	'2022-07-30'),
	(4,	4,	'work',		200,	'2022-07-22'),
	(5,	5,	'work',		100,	'2022-07-23'),
	(6,	6,	'deliveroo',-50,	'2022-07-28'),
	(7,	7,	'deliveroo',-30, 	'2022-09-15'),
	(8,	8,	'deliveroo',-25,	'2022-09-07'),
	(9,	9,	'just-eat',	-19.5,	'2022-08-10'),
	(10,10,	'deliveroo',-21,	'2022-09-16'),
	(11,11,	'just-eat',	-24,	'2022-07-31'),
	(12,12,	'work',		580,	'2022-08-30'),
	(13,13,	'just-eat',	-31,	'2022-09-04'),
	(14,14,	'deliveroo',-26,	'2022-07-06'),
	(15,15,	'just-eat',	-24,	'2022-07-18'),
	(16,1,	'deliveroo',-19,	'2023-01-27'),
	(17,2,	'work',		435,	'2022-08-15'),
	(18,3,	'work',		415,	'2022-07-03'),
	(19,4,	'just-eat',-100,	'2022-08-27'),
	(20,5,	'deliveroo',-50,	'2022-09-13'),
	(21,6,	'deliveroo',-24,	'2022-08-11'),
	(22,7,	'just-eat',	-27,	'2022-08-31'),
	(23,8,	'work',		900,	'2022-08-12'),
	(24,9,	'work',		1100,	'2022-07-08'),
	(25,10,	'just-eat',	-29,	'2022-09-17'),
	(26,11,	'just-eat',	-26,	'2022-08-28'),
	(27,12,	'loan',		-200,	'2022-07-05'),
	(28,13,	'work',		399,	'2022-07-17'),
	(29,14,	'work',		299,	'2022-07-27'),
	(30,15,	'just-eat',	-23,	'2022-07-13');
	
Use BankDB;

delimiter //
CREATE PROCEDURE LoneBefore7th()
BEGIN
SELECT loans.LoanID,accounts.AccountID,loans.Dayofpay,customer.Fullname FROM loans
Inner Join accounts on loans.AccountID = accounts.AccountID
Inner Join Customer on accounts.CustomerID = customer.CustomerID
Where Dayofpay <= 7;
END//




delimiter //
CREATE PROCEDURE Past5Day()
BEGIN
SELECT * FROM transactions

Where date >= DATE(NOW()) + INTERVAL -5 DAY
AND date < DATE(NOW()) + INTERVAL 0 DAY;
END//





delimiter //
CREATE PROCEDURE Above5000()
BEGIN
SELECT transactions.AccountId,customer.Fullname,
transactions.Amount as Transaction_balance,accounts.Open_balance
FROM transactions
Inner Join accounts on transactions.AccountID = accounts.AccountID
Inner Join Customer on accounts.CustomerID = customer.CustomerID

Group by AccountID 
Having Transaction_balance + Open_balance > 5000;
END//




delimiter //
CREATE PROCEDURE Totalout()
BEGIN
SELECT SUM(Amount + Open_balance) as Totaloutstanding
FROM transactions
Inner Join accounts on transactions.AccountID = accounts.AccountID
Inner Join Customer on accounts.CustomerID = customer.CustomerID;

END//