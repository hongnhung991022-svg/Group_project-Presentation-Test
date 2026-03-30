INSERT INTO MANAGERS(NAME,BIRTH_DATE)
VALUES ('Lucas','1998') ,
       ('Arthur' ,'1990' ),
	   ('Emma' , '1995') ,
	   ('Hugo' , '1996' );
INSERT INTO EMPLOYEES (NAME ,BIRTH_DATE , POSITION)
VALUES ('Louise' , '1980' , 'Insurance_advisor'),
		('Adam', '1999', 'Customer_advisor'),
		('Gabriel' , '1995', 'Consumer_credit_advisor'),
		('Jade', '1997' , 'Mortgage_advisor'),
		('Anna' , '1990' , 'Wealth_Management_Advisor');
INSERT INTO CLIENTS (CLIENT_ID,NAME, BIRTH_DATE ,TELEPHONE, EMAIL_CLIENT)
VALUES (1034,'Léo', '1982', '12341235' , 'LEO@GMAIL.COM' ),
	   (1322,'Jean','1995' , '12356789' , 'JEAN@GMAIL.COM'),
	   (1128,'Pierre','1997' , '12345676', 'PIERRE@GMAIL.COM'),
	   (2210,'Lina','1980','45678453', 'LINA@GMAIL.COM'),
	   (1287,'Michel','1989', '66668888' , 'MICHEL@GMAIL.COM'), 
	   (2097,'Alice','1985', '11112222', NULL) ,
	   (1537,'François','1993', '22221111' , NULL) ,
	   (2301,'Chloé','1971' , '00001111','CHLOE@GMAIL.COM') ,
	   (2009,'Mila','1999', '88889999', NULL),
	   (1910,'Antony','1991' ,'11116666' , NULL);
INSERT INTO FILES (TITLE, CONTENT, REGISTRATION_TIME, REVIEW, REVIEWER, PERSON_IN_CHARGE) 
VALUES 
	('Insurance Contract', 'Home insurance subscription', '2024-01-10', 1, 1, 1),
	('Savings Account', 'Opening savings account Livret A', '2024-02-12', 1, 2, 2),
	('Consumer Credit', 'Request for personal loan', '2024-03-05', 0, 3, 3),
	('Mortgage Loan', 'Home loan application', '2024-03-20', 1, 4, 4),
	('Investment Portfolio', 'Wealth management portfolio creation', '2024-04-01', 1, 1, 5),
	('Insurance Renewal', 'Car insurance renewal', '2024-04-10', 1, 2, 1),
	('Credit Card Application', 'New credit card request', '2024-04-15', 1, 3, 2),
	('Mortgage Simulation', 'Mortgage simulation request', '2024-04-18', 0, 4, 4),
	('Investment Advice', 'Financial investment advice', '2024-04-20', 1, 1, 5),
	('Consumer Credit', 'Small loan request', '2024-04-22', 1, 2, 3);

-- For the review section, 1 means approved, 0 means not approved.

INSERT INTO CLIENT_STATUS (CLIENT_ID, HAS_BAD_DEBT, JOB_TITLE, MONTHLY_INCOME)
VALUES
	(1034, 0, 'Engineer', 3200),
	(1322, 1, 'Student', 800),
	(1128, 0, 'Teacher', 2500),
	(2210, 0, 'Nurse', 2200),
	(1287, 1, 'Unemployed', 0),
	(2097, 0, 'Accountant', 2800),
	(1537, 0, 'Sales Manager', 3500),
	(2301, 1, 'Part-time Worker', 1200),
	(2009, 0, 'Data Analyst', 3000),
	(1910, 0, 'Technician', 2400);
    
-- BAD_DEBT: 0 = no bad debt, 1 = bad debt