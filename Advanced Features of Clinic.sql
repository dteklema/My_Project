
-- PROJECT 2

-- 1.Create an application programming interface (API)   using stored   procedurest
DELIMITER //
CREATE PROCEDURE GetAllPROVIDERS()
BEGIN
	SELECT *  FROM PROVIDERS;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAllPATIENTS()
BEGIN
	SELECT *  FROM PATIENT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAllRECORDS()
BEGIN
	SELECT *  FROM RECORDS;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAllVISIT()
BEGIN
	SELECT *  FROM VISIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAllPERTINENT()
BEGIN
	SELECT *  FROM PERTINENT;
END //
DELIMITER ;

-- SCRIPT INFORMAING PATINETS THEIR BILLING COST AND TOTAL PAST AMOUNT
DELIMITER $$
CREATE PROCEDURE `UPDATEDREC` ()
BEGIN
	SELECT PATIENT_FIRSTNAME, PATIENT_LASTNAME, COST,
		CASE WHEN COST > 2000 THEN ' PAST DUE WHICH NEEDS TO BE PAID ASAP!'
        WHEN COST =  1500 THEN 'NEXT BILLING -- MAY 30TH, 2020'
        WHEN COST < 250 THEN 'NEXT BILLING -- JUNE 30TH,2020'
        ELSE 'PLEASE REFER TO YOUR ONLINE RECORD ACCOUNT!'
	END AS BILLING_DATE
    FROM PERTINENT, PATIENT; 
END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `REFERPATIENT` ()
BEGIN
	SELECT RECORDS_ID, PATIENT_ID,
		CASE WHEN PATIENT_ID > 12 THEN 'PATIENT NEEDS EMERGENCY CARE!'
		WHEN PATIENT_ID =  12 THEN 'SEND PATIENT TO 2ND FLOOR'
		WHEN PATIENT_ID < 5 THEN 'PLEASE CHECK IN FIRST'
		ELSE 'SEND OTHER PATIENTS TO THIRD FLOOR'
	END AS RECORDS_EXAMORDERS 
	FROM RECORDS; 
END$$

DELIMITER ;

-- SCRIPT REFERING PATINETS BASED ON THEIR PATIENT ID
DELIMITER $$
CREATE PROCEDURE `REFERPATIENT` ()
BEGIN
	SELECT RECORDS_ID, PATIENT_ID,
		CASE WHEN PATIENT_ID > 12 THEN 'PLEASE PRECCED TO EMERGENCY CARE!'
		WHEN PATIENT_ID =  12 THEN 'GO TO THE 2ND FLOOR'
		WHEN PATIENT_ID < 5 THEN 'MUST CHECK IN FIRST'
		ELSE 'SEND OTHER PATIENTS TO THIRD FLOOR'
	END AS RECORDS_EXAMORDERS 
	FROM RECORDS; 
END$$

DELIMITER ;

-- SCRIPT COUNTING PATINETS FOR DIFERENT STATES
DELIMITER $$
CREATE PROCEDURE `GROUPBY` ()
BEGIN
	SELECT COUNT(PATIENT_ID), STATE
    FROM PATIENT
    GROUP BY STATE;
END$$

DELIMITER ;

-- Script to update and edit the data
DELIMITER $$
CREATE PROCEDURE `UPDATETABLES` ()
BEGIN
	SELECT * FROM CLINIC.RECORDS; 
    UPDATE RECORDS
	SET RECORDS_SIGNS = 'RECOVERED SUCESSFULLY'
	WHERE RECORDS_ID = '111';
END$$
DELIMITER ;

-- JOINING TWO TABLES BY PATIENT ID AND CHECK NUMBERS
DELIMITER $$
CREATE PROCEDURE `JOININGTABLES` ()
BEGIN
	SELECT PATIENT.PATIENT_ID, PERTINENT.BILLING_CHECKNUMBERS FROM PATIENT
	INNER JOIN PERTINENT ON PATIENT.PATIENT_ID = PERTINENT.BILLING_CHECKNUMBERS;
	
END$$
DELIMITER ;



 -- SCRIPT EXECUTING PATIENT APPOINTMNENT AND NAME
 DELIMITER $$
CREATE PROCEDURE `SELECTMULTIPLE` ()
BEGIN
	SELECT   PERTINENT_APPOINTMENTS FROM PERTINENT UNION
	SELECT PATIENT_FIRSTNAME FROM PATIENT;
	
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `ADDRESSUPDA` ()
BEGIN
	SELECT * FROM CLINIC.PATIENT;
	UPDATE PATIENT
	SET ADDRESS = 'University City'
	WHERE PATIENT_FIRSTNAME = 'Hosie' AND PATIENT_LASTNAME = 'Fred';
END$$
DELIMITER ;

call CLINIC.GetAllPERTINENT();
call CLINIC.GetAllPATIENTS();
call CLINIC.GetAllPROVIDERS();
call CLINIC.GetAllVISIT();
call CLINIC.GetAllRECORDS();
call CLINIC.JOININGTABLES();
call CLINIC.ADDRESSUPDA();
call CLINIC.GROUPBY();
call CLINIC.REFERPATIENT();
call CLINIC.SELECTMULTIPLE();
call CLINIC.UPDATETABLES();

-- 2.Add user authentication so that only authorized users can access the database
create user 'AUTHENUSER'@'LOCALHOST' identified by 'DOCPASSWORD';
create user 'RECEPTIONISTS'@'LOCALHOST' identified by 'DOCPASSWORD';
select user from mysql.user;
FLUSH PRIVILEGES; 
GRANT ALL PRIVILEGES ON CLINIC.* TO'AUTHENTICATEDUSER'@'localhost';
FLUSH PRIVILEGES;
-- CHECKING WHO ARE THE AUTHENTICATED USERS AND WHAT THEY CAN DO
SHOW GRANTS FOR 'AUTHENUSER' @'LOCALHOST';



-- 3.Adding role-based access control to limit the functions that a user can perform.
	-- Doctors will be able to insert, delet, and update;
    -- While receptionist dont have the previlage to delete anything within the database
CREATE ROLE 'DOCTORS', 'RECEPTIONIST';
GRANT ALL ON CLINIC_db.* TO 'DOCTORS';
GRANT SELECT ON CLINIC_db.* TO 'RECEPTIONIST';
GRANT INSERT, UPDATE, DELETE ON CLINIC.* TO 'DOCTORS';
GRANT INSERT, UPDATE  ON CLINIC.* TO 'RECEPTIONIST';
-- CHECKING WHO ARE THE AUTHENTICATED USERS AND WHAT THEY CAN DO
SHOW GRANTS FOR 'DOCTORS';
SHOW GRANTS FOR 'RECEPTIONIST';


-- 4. Creating triggers for every change made withing a table which will show on the trigger_table. 

-- TRIGGERS OF UPDATE, DELETE, AND INSERT IN TO PROVIDERS table  
CREATE TRIGGER INSERTTRIGGER_TOPROVIDER AFTER INSERT 
ON PROVIDERS FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'INSERT') ;

CREATE TRIGGER UPDATETRIGGER_TOPROVIDER AFTER UPDATE 
ON PROVIDERS FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'UPDATE') ;

CREATE TRIGGER DELETETRIGGER_TOPROVIDER BEFORE DELETE 
ON PROVIDERS FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'DELETE') ;


-- TRIGGERS OF UPDATE, DELETE, AND INSERT IN TO RECORDS table  
CREATE TRIGGER INSERTTRIGGER_INTORECORD AFTER INSERT 
ON RECORDS FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'INSERT') ;

CREATE TRIGGER UPDATETRIGGER_INTORECORD AFTER UPDATE 
ON RECORDS FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'UPDATE') ;

CREATE TRIGGER DELETETRIGGER_INTORECORD BEFORE DELETE 
ON RECORDS FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'DELETE') ;


-- TRIGGERS OF UPDATE, DELETE, AND INSERT IN TO VISIT table  
CREATE TRIGGER INSERTTRIGGER_INTOVISIT AFTER INSERT 
ON VISIT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'INSERT') ;

CREATE TRIGGER UPDATETRIGGER_INTOVISIT AFTER UPDATE 
ON VISIT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'UPDATE') ;

CREATE TRIGGER DELETETRIGGER_INTOINTOVISIT BEFORE DELETE 
ON VISIT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'DELETE') ;


--  TRIGGERS OF UPDATE, DELETE, AND INSERT IN TO PERTINENT table 
CREATE TRIGGER INSERTTRIGGER_INTOPERTINENT AFTER INSERT 
ON PERTINENT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'INSERT') ;

CREATE TRIGGER UPDATETRIGGER_INTOPERTINENT AFTER UPDATE 
ON PERTINENT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'UPDATE') ;

CREATE TRIGGER DELETETRIGGER_INTOPERTINENT BEFORE DELETE 
ON PERTINENT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'DELETE') ;


--  TRIGGERS OF UPDATE, DELETE, AND INSERT IN TO PATIENT table 
CREATE TRIGGER INSERTTRIGGER_INTOPATIENT AFTER INSERT 
ON PATIENT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'INSERT') ;

CREATE TRIGGER UPDATETRIGGER_INTOPATIENT AFTER UPDATE 
ON PATIENT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'UPDATE') ;

CREATE TRIGGER DELETETRIGGER_INTOPATIENT BEFORE DELETE 
ON PATIENT FOR EACH ROW INSERT INTO TRIGGER_TIME (USER_NAM,TRIGGER_DATE,ACTION) VALUES(current_user(),NOW(), 'DELETE') ;

-- TESTING TRIGGERS on each tables
SELECT * FROM CLINIC.RECORDS;
	UPDATE RECORDS
	SET RECORDS_SIGNS = 'Sucess'
	WHERE RECORDS_ID = '15';

    
INSERT INTO RECORDS(PATIENT_ID, RECORDS_ID, RECORDS_SIGNS,RECORDS_EXAMORDERS,RECORDS_PRESCRIPTIONS,RECORDS_DISCHARGE)
VALUES(90,0090,'Fever','000','Pre.241','Dis -- 08.1');

SELECT * FROM CLINIC.RECORDS; 
DELETE FROM RECORDS 
WHERE RECORDS_DISCHARGE = 'Dis -- 01.25';

INSERT INTO PATIENT (PATIENT_ID, PATIENT_FIRSTNAME, PATIENT_LASTNAME,PATIENT_DOB, ADDRESS,CITY,STATE,ZIP_CODE,INSURANCE_TYPE)
VALUES (00,'AlA','Js','2009-05-13','PO Box 107','Raleigh','OK','70209','Metropolitan');

SELECT * FROM TRIGGER_TIME;

-- 5. Adding indexes and views so that frequently used queries and changes to the database are most efficient.
-- Creating indexes for evrytable on the database

CREATE  INDEX indx_on_PATIENT_ID ON PATIENT(PATIENT_ID);
CREATE  INDEX indx_on_PROVIDER_ID ON PROVIDERS(PROVIDERS_FIRSTNAME);
CREATE  INDEX indx_on_PERTINENT_ID ON PERTINENT(COST);
CREATE  INDEX indx_on_RECORDS_ID ON RECORDS(RECORDS_SIGNS);
CREATE  INDEX indx_on_VISIT_ID ON VISIT(VISIT_FACILITY);

-- Creating views on each table on the database
	-- VIEW ON PATIENT TABLE 
CREATE VIEW PATIENT_VW AS SELECT PATIENT_ID, PATIENT_FIRSTNAME FROM PATIENT WHERE STATE = 'NC' AND INSURANCE_TYPE = 'Blue Cross Blue shield';

-- VIEW ON PROVIDERS TABLE 
CREATE VIEW PROVIDERS_VW AS SELECT PROVIDERS_ID, PROVIDERS_FIRSTNAME FROM PROVIDERS WHERE PROVIDERS_PROFESSION = 'MANAGMENT';

-- VIEW ON RECORDS TABLE
CREATE VIEW RECORDS_VW AS SELECT PATIENT_ID,  RECORDS_EXAMORDERS FROM RECORDS WHERE RECORDS_SIGNS = 'Stomach flu';

-- VIEW ON VISITS TABLE 
CREATE VIEW VISIT_VW AS SELECT VISIT_date,  PATIENT_ID FROM VISIT WHERE VISIT_facility = 'URGENT CARE';

-- VIEW ON PERTINENT TABLE 
CREATE VIEW PERTINENT_VW AS SELECT patient_ID, PERTINENT_APPOINTMENTS, PERTINENT_EXAMROOMS FROM PERTINENT WHERE COST = '2007.86';
