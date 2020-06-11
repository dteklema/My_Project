
-- create the database
-- DROP DATABASE IF EXISTS CLINIC;
CREATE DATABASE CLINIC;


-- select the database
USE CLINIC;


/*Ptient demographic information*/
CREATE TABLE IF NOT EXISTS PATIENT
(
  PATIENT_ID             INT(11)              NOT NULL,
  PATIENT_FIRSTNAME     VARCHAR(45),
  PATIENT_LASTNAME      VARCHAR(45),
  PATIENT_DOB    		DATE,
  ADDRESS     			VARCHAR(45),
  CITY         			VARCHAR(45)    		NOT NULL,
  STATE        			VARCHAR(45)         NOT NULL,
  ZIP_CODE          	VARCHAR(20)     	NOT NULL,
  INSURANCE_TYPE        VARCHAR(45)     	NOT NULL,
  
  CONSTRAINT PATIENT_PK
	PRIMARY KEY (PATIENT_ID)

);

-- Table will be used to record every insert into tables
CREATE TABLE IF NOT EXISTS TRIGGER_TIME
(
USER_NAM			VARCHAR(45),
 TRIGGER_DATE		DATETIME DEFAULT NULL,
 ACTION 	VARCHAR(45)	 DEFAULT NULL
);

-- create the tables
/*Patientdemographic information*/
CREATE TABLE IF NOT EXISTS VISIT
(
  VISIT_facility            VARCHAR(45),
  VISIT_date			    DATE,
  PATIENT_ID         		INT(11)        NOT NULL,
  
  CONSTRAINT VISIT_PK
  FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT (PATIENT_ID)
);


/*Clinical care information*/

CREATE TABLE IF NOT EXISTS RECORDS
(
  PATIENT_ID          			INT(11)            NOT NULL,
  RECORDS_ID            		INT(11)          	NOT NULL,
  RECORDS_SIGNS             	VARCHAR(45),
  RECORDS_EXAMORDERS        	VARCHAR(45),
  RECORDS_PRESCRIPTIONS     	VARCHAR(45),
  RECORDS_DISCHARGE       	    VARCHAR(45),    
  
  CONSTRAINT RECORDS_PK 
	PRIMARY KEY (RECORDS_ID),
CONSTRAINT RECORDS_FK_PATIENT
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT (PATIENT_ID)
  
);

/*Provider information*/
CREATE TABLE IF NOT EXISTS PROVIDERS
(
  RECORDS_ID           			INT(11)          	    NOT NULL,
  PROVIDERS_ID          		INT(11)					NOT NULL,
  PROVIDERS_FIRSTNAME    		VARCHAR(45)        	    UNIQUE,
  PROVIDERS_LASTNAME      		VARCHAR(45)       		UNIQUE,
  PROVIDERS_PROFESSION			VARCHAR(45),
  DEPARTMENTS_ID				VARCHAR(10),
 
 CONSTRAINT PROVIDERS_PK
  FOREIGN KEY (RECORDS_ID ) REFERENCES RECORDS (RECORDS_ID )
 
);

/*Clinical pertinent information*/

CREATE TABLE IF NOT EXISTS  PERTINENT
(
  PERTINENT_APPOINTMENTS      		DATE 					NOT NULL,
  PERTINENT_EXAMROOMS            	INT(11),
  PATIENT_ID						INT(11),
  BILLING_CHECKNUMBERS				VARCHAR(45)         	UNIQUE,
  BILLING_DATE						DATE					NOT NULL,
  COST								DECIMAL(9,2)			NOT NULL,
  
CONSTRAINT PERTINENT_PK
	PRIMARY KEY (PERTINENT_APPOINTMENTS),
CONSTRAINT PERTINENT_FK_PATIENT
FOREIGN KEY (patient_id) REFERENCES PATIENT (PATIENT_ID)
);

-- insert rows into the tables
INSERT INTO PATIENT VALUES 
(1,'Maria','Micheal','2014-09-25','PO Box 101','Raleigh','NC','28001','Blue Cross Blue shield'),
(2,'Ben','Eldi','1993-06-23','PO Box 102','Charlotte','ND','28034','Metropolitan'),
(3,'Chris','Brook','1975-04-10','PO Box 103','Monroe','NC','28056','Centene Corp'),
(4,'Ross','Furuel','1988-04-12','PO Box 104','Indian Trail','NC','28909','UnitedHealth'),
(5,'Jenifer','Hernandez','1996-05-13','PO Box 105','Charlotte','NC','27909','Centene Corp'),
(6,'Adella','Robert','2012-12-20','PO Box 106','Charlotte','NY','28034','Blue Cross Blue shield'),
(7,'Berni','Peirce','1998-09-26','PO Box 107','Raleigh','NC','32900','KCentene Corp'),
(8,'Ember','Howard','1989-08-30','PO Box  108','Wilmington','SC','28090','Blue Cross Blue shield'),
(9,'Hosie','Fred','2014-02-26','PO Box 109','Raleigh','NC','28905','UnitedHealth'),
(10,'Marcy','Antonio','1985-04-23','PO Box 110','Charlotte','NC','32004','Blue Cross Blue shield'),
(11,'Mike','Erikson','1965-12-13','PO Box 111','Wingate','SC','34002','KCentene Corp'),
(12,'Golden','Thomas','2010-11-13','PO Box 112','Wingate','DC','28045','Metropolitan'),
(13,'Robert','Martin','1985-08-13','PO Box 113','Raleigh','NC','37090','Blue Cross Blue shield'),
(14,'Stephen','Benjamin','1999-05-13','PO Box 114','Raleigh','NC','280345','Centene Corp'),
(15,'Mark','Jaime','1975-12-13','PO Box 115','Raleigh','OH','28067','Centene Corp'),
(16,'Lynda','John','2002-05-13','PO Box 117','Raleigh','OK','70209','Metropolitan'),
(17,'Veta','Jose','2011-04-24','PO Box 209','Raleigh','NC','60900','Centene Corp'),
(18,'Alferdo','Brendon','2016-04-03','PO Box 309','Wingate','NC','30945','Blue Cross Blue shield'),
(19,'Lory','Eric','1978-04-23','PO Box 509','Raleigh','OH','54690','Blue Cross Blue shield'),
(20,'Christian','Ross','2004-04-13','PO Box 140','Monroe','NC','35909','Centene Corp'),
(21,'Haben','Hadson','2018-09-25','PO Box 105','Raleigh','NC','28001','Blue Cross Blue shield'),
(22,'Mack','Lane','1996-06-23','PO Box 104','Charlotte','ND','28034','Metropolitan'),
(23,'Jess','Brooks','1978-04-10','PO Box 107','Monroe','NC','28056','Centene Corp'),
(24,'Jessica','Graca','1989-04-12','PO Box 109','Indian Trail','NC','28909','UnitedHealth'),
(25,'Robel','Kelley','1978-05-13','PO Box 122','Charlotte','NC','27909','Centene Corp'),
(26,'Pelle','Barker','2015-12-20','PO Box 133','Charlotte','NY','28034','Blue Cross Blue shield'),
(27,'Hajer','McKinney','1994-09-26','PO Box 144','Raleigh','NC','32900','KCentene Corp'),
(28,'Mike','Cox','1983-08-30','PO Box  144','Wilmington','SC','28090','Blue Cross Blue shield'),
(29,'Darcy','Fletcher','2015-02-26','PO Box 146','Raleigh','NC','28905','UnitedHealth'),
(30,'kaylie','Mcdonald','1982-04-23','PO Box 134','Charlotte','NC','32004','Blue Cross Blue shield'),
(31,'Afom','Green','1965-12-13','PO Box 112','Wingate','SC','34002','KCentene Corp'),
(32,'Seny','Anderson','2018-11-13','PO Box 134','Wingate','DC','28045','Metropolitan'),
(33,'Snaiy','Higgins','1989-08-13','PO Box 116','Raleigh','NC','37090','Blue Cross Blue shield'),
(34,'Neat','paul','1992-05-13','PO Box 118','Raleigh','NC','280345','Centene Corp'),
(35,'Kail','Davidson','1976-12-13','PO Box 189','Raleigh','OH','28067','Centene Corp'),
(36,'Sean','Estrada','2003-05-13','PO Box 134','Raleigh','OK','70209','Metropolitan'),
(37,'Max','Chavez','2016-04-24','PO Box 267','Raleigh','NC','60900','Centene Corp'),
(38,'Adair','Obrien','2012-04-03','PO Box 303','Wingate','NC','30945','Blue Cross Blue shield'),
(39,'Bun','Glover','1970-04-23','PO Box 523','Raleigh','OH','54690','Blue Cross Blue shield'),
(40,'Christn','Dixon','2002-04-13','PO Box 167','Monroe','NC','35909','Centene Corp'),
(41,'Nini','Mann','2015-09-25','PO Box 134','Raleigh','NC','28001','Blue Cross Blue shield'),
(42,'Nene','Chambers','1996-06-23','PO Box 165','Charlotte','NC','28034','Metropolitan'),
(43,'Asu','Bruke','1972-04-10','PO Box 144','Monroe','NC','28056','Centene Corp'),
(44,'Eldu','Torres','1989-04-12','PO Box 176','Indian Trail','NC','28909','UnitedHealth'),
(45,'Ella','Walter','1999-05-13','PO Box 145','Charlotte','NC','27909','Centene Corp'),
(46,'Naomi','Oliver','2014-12-20','PO Box 176','Charlotte','NY','28034','Blue Cross Blue shield'),
(47,'Aman','Barlow','1999-09-26','PO Box 134','Raleigh','NC','32900','KCentene Corp'),
(48,'Nebie','Schneider','1985-08-30','PO Box 89','Wilmington','SC','28090','Blue Cross Blue shield'),
(49,'Hub','Andrew','2015-02-26','PO Box 134','Raleigh','NC','28905','UnitedHealth'),
(50,'Eldi','Melven','1982-04-23','PO Box 154','Charlotte','NC','32004','Blue Cross Blue shield'),
(51,'Flida','Ross','1968-12-13','PO Box 176','Wingate','SC','34002','KCentene Corp'),
(52,'Rachel','Tomi','2013-11-13','PO Box 187','Wingate','DC','28045','Metropolitan'),
(53,'Benji','Bob','1987-08-13','PO Box 182','Raleigh','NC','37090','Blue Cross Blue shield'),
(54,'Hellen','Jhon','1993-05-13','PO Box 124','Raleigh','NC','280345','Centene Corp'),
(55,'Jessica','Tecle','1979-12-13','PO Box 176','Raleigh','OH','28067','Centene Corp'),
(56,'Albert','Johnos','2001-05-13','PO Box 187','Raleigh','OK','70209','Metropolitan'),
(57,'Vetjay','Josied','2016-04-24','PO Box 289','Raleigh','NC','60900','Centene Corp'),
(58,'Floyd','Todd','2014-04-03','PO Box 343','Wingate','NC','30945','Blue Cross Blue shield'),
(59,'Hellen','Will','1979-04-23','PO Box 567','Raleigh','OH','54690','Blue Cross Blue shield'),
(60,'Caleb','Padilla','2008-04-13','PO Box 154','Monroe','NC','35909','Centene Corp'),
(61,'Han','Tesfe','2014-09-25','PO Box 101','Raleigh','NC','28001','Blue Cross Blue shield'),
(62,'Judy','Tekle','1993-06-23','PO Box 102','Charlotte','ND','28034','Metropolitan'),
(63,'Yodit','Kidane','1975-04-10','PO Box 103','Monroe','NC','28056','Centene Corp'),
(64,'Adu','George','1988-04-12','PO Box 104','Indian Trail','NC','28909','UnitedHealth'),
(65,'Ghenet','Lustar','1996-05-13','PO Box 105','Charlotte','NC','27909','Centene Corp'),
(66,'Adela','Barlis','2012-12-20','PO Box 106','Charlotte','NY','28034','Blue Cross Blue shield'),
(67,'Ermi','Nahom','1998-09-26','PO Box 107','Raleigh','NC','32900','KCentene Corp'),
(68,'Ehlan','Aaron','1989-08-30','PO Box  108','Wilmington','SC','28090','Blue Cross Blue shield'),
(69,'Yushan','Nebie','2014-02-26','PO Box 109','Raleigh','NC','28905','UnitedHealth'),
(70,'Darcy','Aman','1985-04-23','PO Box 110','Charlotte','NC','32004','Blue Cross Blue shield'),
(71,'Markis','Adonai','1965-12-13','PO Box 111','Wingate','SC','34002','KCentene Corp'),
(72,'Buni','Jossi','2010-11-13','PO Box 112','Wingate','DC','28045','Metropolitan'),
(73,'Banna','Harvi','1985-08-13','PO Box 113','Raleigh','NC','37090','Blue Cross Blue shield'),
(74,'Junior','Smith','1999-05-13','PO Box 114','Raleigh','NC','280345','Centene Corp'),
(75,'Hermi','Markie','1975-12-13','PO Box 115','Raleigh','OH','28067','Centene Corp'),
(76,'Lidia','Johnes','2002-05-13','PO Box 117','Raleigh','OK','70209','Metropolitan'),
(77,'Verci','Yossi','2011-04-24','PO Box 209','Raleigh','NC','60900','Centene Corp'),
(78,'Prince','Futruel','2016-04-03','PO Box 309','Wingate','NC','30945','Blue Cross Blue shield'),
(79,'Jeniffer','Nene','1978-04-23','PO Box 509','Raleigh','OH','54690','Blue Cross Blue shield'),
(80,'Christi','Ros','2004-04-13','PO Box 140','Monroe','NC','35909','Centene Corp');



-- insert rows into the tables
INSERT INTO VISIT VALUES
('Burn unit', '2010-09-07',1),
('Emergency', '2020-10-10',2),
('Intensive care', '2020-10-12',3),
('Urgent care', '2020-04-25',4),
('Check up', '2020-12-31',5),
('Emergency', '2020-11-07',6),
('Emergency', '2020-12-07',7),
('Urgent care', '2020-05-13',8),
('Check up', '2020-12-18',9),
('Burn unit', '2020-11-23',10),
('Urgent care', '2020-09-18',11),
('Burn Unit', '2020-09-22',12),
('Intensive care', '2020-03-11',13),
('urget care', '2020-02-19',14),
('Urgent care', '2020-06-23',15),
('Check up', '2020-11-10',16),
('Burn unit', '2020-04-23',17),
('Urgent care', '2020-10-22',18),
('BURN UNIT', '2020-06-26',19),
('Intensive care', '2020-08-19',20),
('Burn unit', '2020-09-07',21),
('Emergency', '2020-10-10',22),
('Intensive care', '2020-10-12',23),
('Urgent care', '2020-04-25',24),
('Check up', '2020-12-31',25),
('Emergency', '2020-11-07',26),
('Emergency', '2020-12-07',27),
('Urgent care', '2020-05-13',28),
('Check up', '2020-12-18',29),
('Burn unit', '2020-11-23',20),
('Urgent care', '2020-09-18',21),
('Burn Unit', '2020-09-22',22),
('Intensive care', '2020-03-11',23),
('urget care', '2020-02-19',24),
('Urgent care', '2020-06-23',25),
('Check up', '2020-11-10',26),
('Burn unit', '2020-04-23',27),
('Urgent care', '2020-10-22',28),
('BURN UNIT', '2020-06-26',29),
('Intensive care', '2020-08-19',30),
('Burn unit', '2020-09-07',31),
('Emergency', '2020-10-10',32),
('Intensive care', '2020-10-12',33),
('Urgent care', '2020-04-25',34),
('Check up', '2020-12-31',35),
('Emergency', '2020-11-07',36),
('Emergency', '2020-12-07',37),
('Urgent care', '2020-05-13',38),
('Check up', '2020-12-18',39),
('Burn unit', '2020-11-23',40),
('Urgent care', '2020-09-18',41),
('Burn Unit', '2020-09-22',42),
('Intensive care', '2020-03-11',43),
('urget care', '2020-02-19',44),
('Urgent care', '2020-06-23',45),
('Check up', '2020-11-10',46),
('Burn unit', '2020-04-23',47),
('Urgent care', '2020-10-22',48),
('BURN UNIT', '2020-06-26',49),
('Intensive care', '2020-08-19',50),
('Burn unit', '2020-09-07',51),
('Emergency', '2020-10-10',52),
('Intensive care', '2020-10-12',53),
('Urgent care', '2020-04-25',54),
('Check up', '2020-12-31',55),
('Emergency', '2020-11-07',56),
('Emergency', '2020-12-07',57),
('Urgent care', '2020-05-13',58),
('Check up', '2020-12-18',59),
('Burn unit', '2020-11-23',60),
('Urgent care', '2020-09-18',61),
('Burn Unit', '2020-09-22',62),
('Intensive care', '2020-03-11',63),
('urget care', '2020-02-19',64),
('Urgent care', '2020-06-23',65),
('Check up', '2020-11-10',66),
('Burn unit', '2020-04-23',67),
('Urgent care', '2020-10-22',68),
('BURN UNIT', '2020-06-26',69),
('Intensive care', '2020-08-19',70),
('Burn unit', '2020-11-23',71),
('Urgent care', '2020-09-18',72),
('Burn Unit', '2020-09-22',73),
('Intensive care', '2020-03-11',74),
('urget care', '2020-02-19',75),
('Urgent care', '2020-06-23',76),
('Check up', '2020-11-10',77),
('Burn unit', '2020-04-23',78),
('Urgent care', '2020-10-22',79),
('BURN UNIT', '2020-06-26',80);


-- insert rows into the tables

INSERT INTO RECORDS VALUES 
(1,0011,'Fever and headache','001','Pre.100','Dis -- 01.1'), 
(2,0012,'Stomach ache','002','Pre.101','Dis -- 01.12'), 
(3,0013,'Broken arm','003','Pre.102','Dis -- 01.13'), 
(4,0014,'Migrane','004','Pre.103','Dis -- 01.14'), 
(5,0015,'Blood Pressure','005','Pre.104','Dis -- 01.15'), 
(6,0016,'Stomach flu','006','Pre.105','Dis -- 01.16'), 
(7,0017,'Fatigue','007','Pre.106','Dis -- 01.17'), 
(8,0018,'Fever','008','Pre.107','Dis -- 01.18'), 
(9,0019,'Nose Bleeding','009','Pre.108','Dis -- 01.19'), 
(10,0110,'Swollen ankel','0001','Pre.109','Dis -- 01.20'), 
(11,0111,'Shortness of breath','0002','Pre.110','Dis -- 01.21'), 
(12,0112,'Seizures','0003','Pre.111','Dis -- 01.22'), 
(13,0113,'Allergic reaction','0004','Pre.112','Dis -- 01.23'), 
(14,0114,'Fever','0005','Pre.113','Dis -- 01.24'), 
(15,0115,'Headache','0006','Pre.114','Dis -- 01.25'), 
(16,0116,'Stomach flu','0007','Pre.115','Dis -- 01.26'), 
(17,0117,'Broken arm','0008','Pre.116','Dis -- 01.27'), 
(18,0118,'Migrane','0009','Pre.117','Dis -- 01.27'), 
(19,0119,'Burned arm','0000','Pre.118','Dis -- 01.28'), 
(20,0120,'Back pain','00010','Pre.119','Dis -- 01.29'),
(21,0121,'Fever and headache','001','Pre.100','Dis -- 01.1'), 
(22,0122,'Stomach ache','002','Pre.101','Dis -- 01.12'), 
(23,0123,'Broken arm','003','Pre.102','Dis -- 01.13'), 
(24,0124,'Migrane','004','Pre.103','Dis -- 01.14'), 
(25,0125,'Blood Pressure','005','Pre.104','Dis -- 01.15'), 
(26,0126,'Stomach flu','006','Pre.105','Dis -- 01.16'), 
(27,0127,'Fatigue','007','Pre.106','Dis -- 01.17'), 
(28,0030,'Fever','008','Pre.107','Dis -- 01.18'), 
(29,0031,'Nose Bleeding','009','Pre.108','Dis -- 01.19'), 
(30,0132,'Swollen ankel','0001','Pre.109','Dis -- 01.20'), 
(31,0133,'Shortness of breath','0002','Pre.110','Dis -- 01.21'), 
(32,0134,'Seizures','0003','Pre.111','Dis -- 01.22'), 
(33,0135,'Allergic reaction','0004','Pre.112','Dis -- 01.23'), 
(34,0136,'Fever','0005','Pre.113','Dis -- 01.24'), 
(35,0137,'Headache','0006','Pre.114','Dis -- 01.25'), 
(36,0138,'Stomach flu','0007','Pre.115','Dis -- 01.26'), 
(37,0139,'Broken arm','0008','Pre.116','Dis -- 01.27'), 
(38,0140,'Migrane','0009','Pre.117','Dis -- 01.27'), 
(40,0141,'Burned arm','0000','Pre.118','Dis -- 01.28'), 
(41,0142,'Back pain','00010','Pre.119','Dis -- 01.29'),
(42,0143,'Stomach ache','002','Pre.101','Dis -- 01.12'), 
(43,0144,'Broken arm','003','Pre.102','Dis -- 01.13'), 
(44,0145,'Migrane','004','Pre.103','Dis -- 01.14'), 
(45,0146,'Blood Pressure','005','Pre.104','Dis -- 01.15'), 
(46,0147,'Stomach flu','006','Pre.105','Dis -- 01.16'), 
(48,0148,'Fever','008','Pre.107','Dis -- 01.18'), 
(49,0149,'Nose Bleeding','009','Pre.108','Dis -- 01.19'), 
(50,0150,'Swollen ankel','0001','Pre.109','Dis -- 01.20'), 
(51,0151,'Shortness of breath','0002','Pre.110','Dis -- 01.21'), 
(52,0152,'Seizures','0003','Pre.111','Dis -- 01.22'), 
(53,0153,'Allergic reaction','0004','Pre.112','Dis -- 01.23'), 
(54,0154,'Fever','0005','Pre.113','Dis -- 01.24'), 
(55,0155,'Headache','0006','Pre.114','Dis -- 01.25'), 
(56,0156,'Stomach flu','0007','Pre.115','Dis -- 01.26'), 
(57,0157,'Broken arm','0008','Pre.116','Dis -- 01.27'), 
(58,0158,'Migrane','0009','Pre.117','Dis -- 01.27'), 
(59,0159,'Burned arm','0000','Pre.118','Dis -- 01.28'), 
(60,0160,'Back pain','00010','Pre.119','Dis -- 01.29'),
(61,0161,'Fever and headache','001','Pre.100','Dis -- 01.1'), 
(62,0162,'Stomach ache','002','Pre.101','Dis -- 01.12'), 
(63,0163,'Broken arm','003','Pre.102','Dis -- 01.13'), 
(64,0164,'Migrane','004','Pre.103','Dis -- 01.14'), 
(65,0165,'Blood Pressure','005','Pre.104','Dis -- 01.15'), 
(66,0166,'Stomach flu','006','Pre.105','Dis -- 01.16'), 
(67,0167,'Fatigue','007','Pre.106','Dis -- 01.17'), 
(68,0168,'Fever','008','Pre.107','Dis -- 01.18'), 
(69,0169,'Nose Bleeding','009','Pre.108','Dis -- 01.19'), 
(70,0170,'Swollen ankel','0001','Pre.109','Dis -- 01.20'), 
(71,0171,'Shortness of breath','0002','Pre.110','Dis -- 01.21'), 
(72,0172,'Seizures','0003','Pre.111','Dis -- 01.22'), 
(73,0173,'Allergic reaction','0004','Pre.112','Dis -- 01.23'), 
(74,0174,'Fever','0005','Pre.113','Dis -- 01.24'), 
(75,0175,'Headache','0006','Pre.114','Dis -- 01.25'), 
(76,0176,'Stomach flu','0007','Pre.115','Dis -- 01.26'), 
(77,0177,'Broken arm','0008','Pre.116','Dis -- 01.27'), 
(78,0178,'Migrane','0009','Pre.117','Dis -- 01.27'), 
(79,0179,'Burned arm','0000','Pre.118','Dis -- 01.28'), 
(80,0180,'Back pain','00010','Pre.119','Dis -- 01.29');


-- insert rows into the tables
INSERT INTO PROVIDERS VALUES 
(0011,001,'Robiel','Efi','Nurse','01'),
(0012,002,'Jorusalem','Nebi','Physician','02'),
(0013,003,'Marcella','Aaron','Physician','03'),
(0014,004,'Bruce','Jakson','Assistant Nurse','04'),
(0015,004,'Maribel','Efrem','AssistantNurse','05'),
(0016,005,'Danni','Asu','Pysician','06'),
(0017,006,'Eldu','Benni','Managment','07'),
(0018,007,'Hail','Bini','Nurse','08'),
(0019,008,'Layla','Paulos','Physician','09'),
(0110,009,'Ava','Aman','Nurse','10'),
(0111,010,'Marti','Luck','Physician','11'),
(0112,003,'Fev','Yosif','Physician','12'),
(0113,004,'Adair','Marc','Assistant Nurse','13'),
(0114,004,'Shane','Dan','AssistantNurse','14'),
(0115,005,'Brenda','Justin','Pysician','15'),
(0116,006,'Kelly','Smith','Managment','16'),
(0117,007,'Chris','Jhon','Nurse','17'),
(0118,008,'Rob','Robert','Physician','18'),
(0119,009,'Medu','Zaki','Nurse','19'),
(0120,010,'Melat','Shan','Physician',''),
(0011,001,'Meda','Efii','Nurse','01'),
(0012,002,'Jery','Nebii','Physician','02'),
(0013,003,'Marcele','Aarron','Physician','03'),
(0014,004,'Salon','Jaksson','Assistant Nurse','04'),
(0015,004,'Maribell','Effrem','AssistantNurse','05'),
(0016,005,'Dani','Asiu','Pysician','06'),
(0017,006,'Elduu','Beni','Managment','07'),
(0018,007,'Haile','Binii','Nurse','08'),
(0019,008,'Laylla','Pauos','Physician','09'),
(0110,009,'Avai','Amann','Nurse','10'),
(0111,010,'Martti','Lucck','Physician','11'),
(0112,003,'Feven','Yossif','Physician','12'),
(0113,004,'Ben','Markii','Assistant Nurse','13'),
(0114,004,'Shani','Dann','AssistantNurse','14'),
(0115,005,'Brendii','Just','Pysician','15'),
(0116,006,'Kely','Smi','Managment','16'),
(0117,007,'Chrissy','Jhone','Nurse','17'),
(0118,008,'Robei','Rob','Physician','18'),
(0119,009,'Med','Zakki','Nurse','19'),
(0120,010,'Melate','Shani','Physician',''),
(0011,001,'Eldi','Maku','Nurse','01'),
(0012,002,'Haju','Maekel','Physician','02'),
(0013,003,'Assi','not','Physician','03'),
(0014,004,'Yodit','Jokson','Assistant Nurse','04'),
(0015,004,'Astu','Json','AssistantNurse','05'),
(0016,005,'Daniel','Mustova','Pysician','06'),
(0017,006,'Paulo','Hall','Managment','07'),
(0018,007,'Aster','Holaves','Nurse','08'),
(0019,008,'Medi','Palos','Physician','09'),
(0110,009,'Nessi','Amain','Nurse','10'),
(0111,010,'Negasi','Lcki','Physician','11'),
(0112,003,'Fevei','Gabe','Physician','12'),
(0113,004,'Adir','Fini','Assistant Nurse','13'),
(0114,004,'Shue','Dannu','AssistantNurse','14'),
(0115,005,'Bron','Justi','Pysician','15'),
(0116,006,'Jess','Smiti','Managment','16'),
(0117,007,'Jessica','Jhoni','Nurse','17'),
(0118,008,'Nebi','Robi','Physician','18'),
(0119,009,'Melu','Zakii','Nurse','19'),
(0120,010,'Bana','Shann','Physician','');


-- insert rows into the tables
INSERT INTO PERTINENT VALUES 
('2020-04-03','1000','1','67611','2020-05-23','235.00'), 
('2020-11-17','1001','2','36978','2020-03-8','736.10'), 
('2020-01-26','1002','3','1045','2020-07-21','1289.90'), 
('2020-11-09','1003','4','10335','2020-05-23','1234.90'), 
('2020-02-01','1004','5','30045','2020-02-13','439.86'), 
('2020-04-06','1005','6','18853','2020-08-24','546.09'), 
('2020-05-09','1006','7','23765','2020-03-18','7680.97'), 
('2020-03-06','1007','8','01016','2020-06-30','267.80'), 
('2020-02-04','1008','10','10255','2020-03-25','128.99'), 
('2020-10-01','1009','11','11345','2020-06-27','7542.65'), 
('2020-08-23','1010','12','13245','2020-07-29','123.67'), 
('2020-05-16','1011','13','8565','2020-03-13','2345.87'), 
('2020-07-24','1012','14','0345','2020-05-30','1298.05'), 
('2020-02-28','1013','15','99245','2020-04-29','1004.98'), 
('2020-01-23','1014','16','70398','2020-08-19','2007.86'), 
('2020-10-10','1015','17','87245','2020-09-17','4500.65'), 
('2020-06-21','1016','18','50645','2020-11-15','235.89'), 
('2020-01-02','1017','19','19906','2020-10-10','367.98'), 
('2020-02-23','1018','20','14105','2020-07-20','235.87'),

('2020-05-03','1000','21','67101','2020-05-23','235.00'), 
('2020-11-10','1001','22','36798','2020-03-8','736.10'), 
('2020-11-26','1002','23','16945','2020-07-21','1289.90'), 
('2020-06-09','1003','24','10845','2020-05-23','1234.90'), 
('2020-03-01','1004','25','31745','2020-02-13','439.86'), 
('2020-05-06','1005','26','18905','2020-08-24','546.09'), 
('2020-07-09','1006','27','24755','2020-03-18','7680.97'), 
('2020-01-06','1007','28','00116','2020-06-30','267.80'), 
('2020-08-04','1008','29','10155','2020-03-25','128.99'), 
('2020-11-01','1009','30','11445','2020-06-27','7542.65'), 
('2020-05-23','1010','31','15245','2020-07-29','123.67'), 
('2020-02-16','1011','32','8865','2020-03-13','2345.87'), 
('2020-05-24','1012','33','0945','2020-05-30','1298.05'), 
('2020-07-28','1013','34','93245','2020-04-29','1004.98'), 
('2020-09-23','1014','35','75398','2020-08-19','2007.86'), 
('2020-02-10','1015','36','83345','2020-09-17','4500.65'), 
('2020-09-21','1016','37','56445','2020-11-15','235.89'), 
('2020-11-02','1017','38','1186','2020-10-10','367.98'), 
('2020-10-23','1018','39','16125','2020-07-20','235.87'),

('2020-06-03','1000','40','67111','2020-05-23','235.00'), 
('2020-12-17','1001','45','36778','2020-03-8','736.10'), 
('2020-05-26','1002','46','10945','2020-07-21','1289.90'), 
('2020-12-09','1003','47','10345','2020-05-23','1234.90'), 
('2020-04-01','1004','48','36745','2020-02-13','439.86'), 
('2020-01-24','1005','49','1885','2020-08-24','546.09'), 
('2020-05-02','1006','50','24765','2020-03-18','7680.97'), 
('2020-07-04','1007','51','00016','2020-06-30','267.80'), 
('2020-04-02','1008','52','11255','2020-03-25','128.99'), 
('2020-12-05','1009','53','12445','2020-06-27','7542.65'), 
('2020-09-29','1010','54','12245','2020-07-29','123.67'), 
('2020-08-10','1011','55','8765','2020-03-13','2345.87'), 
('2020-09-22','1012','56','0045','2020-05-30','1298.05'), 
('2020-09-25','1013','57','97245','2020-04-29','1004.98'), 
('2020-04-26','1014','58','76398','2020-08-19','2007.86'), 
('2020-12-11','1015','59','87345','2020-09-17','4500.65'), 
('2020-11-22','1016','60','56645','2020-11-15','235.89'), 
('2020-10-09','1017','61','1986','2020-10-10','367.98'), 
('2020-12-25','1018','62','14125','2020-07-20','235.87'),
('2020-02-21','1002','63','10045','2020-07-21','1289.90'), 
('2020-12-19','1003','64','10245','2020-05-23','1234.90'), 
('2020-04-11','1004','65','34745','2020-02-13','439.86'), 
('2020-05-20','1005','66','18854','2020-08-24','546.09'), 
('2020-04-19','1006','67','24715','2020-03-18','7680.97'), 
('2020-07-16','1007','68','00316','2020-06-30','267.80'), 
('2020-04-09','1008','69','14255','2020-03-25','128.99'), 
('2020-12-06','1009','70','17545','2020-06-27','7542.65'), 
('2020-02-25','1010','71','16245','2020-07-29','123.67'), 
('2020-05-10','1011','72','87465','2020-03-13','2345.87'), 
('2020-09-27','1012','73','00454','2020-05-30','1298.05'),
('2020-07-02','1007','74','02516','2020-06-30','267.80'), 
('2020-05-19','1008','75','18255','2020-03-25','128.99'), 
('2020-06-06','1009','76','16445','2020-06-27','7542.65'), 
('2020-09-28','1010','77','02245','2020-07-29','123.67'), 
('2020-08-14','1011','78','87665','2020-03-13','2345.87'), 
('2020-09-20','1012','79','00451','2020-05-30','1298.05'),
('2020-03-25','1012','80','00455','2020-05-30','1298.05');




-- -- Script to update and edit the d


-- -- Script to update and edit the data
-- SELECT * FROM OUTPATIENTCLINIC.PERTINENT;
-- UPDATE PERTINENT
-- SET PERTINENT_examrooms = '2020'
-- WHERE PERTINENT_APPOINTMENTS = '2020-11-21' ;


-- -- Script to update and edit the data
-- SELECT * FROM OUTPATIENTCLINIC.PROVIDERS;
-- UPDATE PROVIDERS
-- SET PROVIDERS_PROFESSION = 'PHYSICAL ASSISTANT'
-- WHERE PROVIDERS_FIRSTNAME = 'Chris' AND PROVIDERS_LASTNAME = 'Jhon' ;



-- -- Script to update and edit the data
-- SELECT * FROM OUTPATIENTCLINIC.VISIT;
-- UPDATE VISIT 
-- SET VISIT_facility  = 'Lab', VISIT_DATE = '2020-02-14'
-- WHERE VISIT_DATE  = '2020-11-07';


-- -- Script selecting data by cheking specific data from vist table
-- SELECT * FROM VISIT
--  WHERE visit_date ='2020-05-13';



-- -- Script selecting data by cheching specific data from vist table
-- SELECT * FROM PROVIDERS
--  WHERE PROVIDERS_PROFESSION ='Nurse';
--  
--  
--  
-- -- SCRIPT SELECTING PATIENT BY TYPE OF INSURANCE 
-- SELECT * FROM PATIENT
--  WHERE INSURANCE_TYPE ='Blue Cross Blue shield';
















