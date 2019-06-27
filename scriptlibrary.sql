DROP TABLE tblHistoricalData;
DROP TABLE tblInterests;
DROP TABLE tblKeywords;
DROP TABLE tblBooks;
DROP TABLE tblPublishers;
DROP TABLE tblPatrons;

CREATE TABLE tblPatrons(
SSN varchar2(12),
LastName varchar2(20),
FirstName varchar2(20),
Address varchar2(20),
City varchar2(20),
State varchar2(2),
Zip varchar2(10),
Telephone varchar2(15),
CONSTRAINT tblPatrons_SSN_pk PRIMARY KEY (SSN));

CREATE TABLE tblPublishers(
PubId varchar2(12),
PubName varchar2(35),
Address varchar2(20),
City varchar2(20),
State varchar2(2),
Zip varchar2(10),
Telephone varchar2(15),
Fax varchar2(15),
CONSTRAINT tblPublishers_PubId_pk PRIMARY KEY (PubId));

CREATE TABLE tblBooks(
ISBN varchar2(16),
AuthLastName varchar2(20),
AuthFirstName varchar2(20),
Title varchar2(40),
Price Number(8,2),
PubId varchar2(12),
CheckedOutTo varchar2(12),
DateDue DATE,
CONSTRAINT tblBooks_ISBN_pk PRIMARY KEY (ISBN),
CONSTRAINT tblBooks_CheckedOutTo_fk 
  FOREIGN KEY (CheckedOutTo) REFERENCES tblPatrons(SSN),
CONSTRAINT tblBooks_PubId_fk 
  FOREIGN KEY (PubId) REFERENCES tblPublishers(PubId));

CREATE TABLE tblKeywords(
ISBN varchar2(16),
Keyword varchar2(20),
CONSTRAINT tblKeywords_ISBN_Keyword_pk PRIMARY KEY (ISBN, Keyword),
CONSTRAINT tblKeywords_ISBN_fk 
  FOREIGN KEY (ISBN) REFERENCES tblBooks(ISBN));

CREATE TABLE tblInterests(
SSN varchar2(12),
Interest varchar2(20),
CONSTRAINT tblInterests_SSN_Interest_pk PRIMARY KEY (SSN, Interest),
CONSTRAINT tblInterests_SSN_fk 
  FOREIGN KEY (SSN) REFERENCES tblPatrons(SSN));

CREATE TABLE tblHistoricalData(
PatronId varchar2(12),
ISBN varchar(16),
DateOut DATE,
CONSTRAINT tblHistData_PatId_ISBN_DOut_pk
  PRIMARY KEY (PatronId, ISBN, DateOut),
CONSTRAINT tblHistoricalData_PatronId_fk
  FOREIGN KEY (PatronId) REFERENCES tblPatrons(SSN),
CONSTRAINT tblHistoricalData_ISBN_fk
  FOREIGN KEY (ISBN) REFERENCES tblBooks(ISBN));

INSERT INTO tblPatrons
VALUES ('000-00-0001', 'Cuttem', 'Will', '104 Cutoff Lane', 'Nome', 'AK', '12345-3432', '(489) 389-2198');
INSERT INTO tblPatrons
VALUES ('372-97-3427', 'Cuttem', 'Wont', '45 Bobbit Ave.', 'Hacksaw', 'MO', '47822-5847', '(348) 342-9006');
INSERT INTO tblPatrons
VALUES ('484-84-3028', 'Baker', 'Judy', '5487 Oak Ave.', 'Colombus', 'GA', '89328-3293', '(303) 556-6749');
INSERT INTO tblPatrons
VALUES ('488-37-2848', 'Jackson', 'Mary', '2734 ''S'' St. apt# 2', 'Spokane', 'WA', '57893-8734', '(505) 553-6473');
INSERT INTO tblPatrons
VALUES ('490-12-7374', 'Jones', 'Sara', '100 S. Pine St.', 'Lenexa', 'KS', '57933-8923', '(913) 456-8467');
INSERT INTO tblPatrons
VALUES ('495-72-3387', 'Jones', 'Rick', '6382 Market Ave.', 'Lenexa', 'KS', '57933-8923', '(913) 344-4834');
INSERT INTO tblPatrons
VALUES ('499-45-8832', 'Wilson', 'Joseph', '3845 Jackson St.', 'Spokane', 'WA', '57483-4432', '(505) 432-9758');
INSERT INTO tblPatrons
VALUES ('500-53-4231', 'Jackson', 'Rachel', '5432 Troost St.', 'Lenexa', 'KS', '57933-8923', '(913) 445-5380');
INSERT INTO tblPatrons
VALUES ('501-45-6543', 'Jones', 'Christian', '4533 Melrose Ave.', 'Flagstaff', 'AZ', '73321-5743', '(408) 455-8855');
INSERT INTO tblPatrons
VALUES ('501-83-2285', 'Limbaugh', 'Rush', '101 N. 105th Circle', 'Annapolis', 'MD', '73904-8943', '(202) 741-4932');
INSERT INTO tblPatrons
VALUES ('503-43-9932', 'Wilmes', 'Lindsay', '2323 Curlew Lane', 'Colombus', 'GA', '48309-9903', '(303) 563-4432');
INSERT INTO tblPatrons
VALUES ('503-53-8884', 'Jetson', 'Judy', '74 W. Thomson', 'Flagstaff', 'AZ', '33248-8823', '(408) 564-5432');
INSERT INTO tblPatrons
VALUES ('505-45-7293', 'Rubble', 'Betty', '7834 Bedrock Ave.', 'Pueblo', 'CO', '57349-8394', '(506) 873-5583');
INSERT INTO tblPatrons
VALUES ('505-83-8932', 'Jackson', 'Rachel', '5709 Walnut St.', 'Rapid City', 'SD', '73893-0843', '(616) 432-7382');
INSERT INTO tblPatrons
VALUES ('506-43-7823', 'Wilmes', 'Otis', '13224 S. Francis St.', 'St. Libory', 'NE', '72393-8439', '(308) 573-5372');
INSERT INTO tblPatrons
VALUES ('510-67-9348', 'O''Neill', 'Margaret', '7343 ''A'' St.', 'Lenexa', 'KS', '85343-3048', '(913) 341-7543');
INSERT INTO tblPatrons
VALUES ('520-65-8973', 'Baker', 'Matthew', '5487 Oak Ave.', 'Colombus', 'GA', '89328-3293', '(303) 556-6749');
INSERT INTO tblPatrons
VALUES ('534-76-9428', 'Quayle', 'Dan', '10034 Virginia Ave.', 'Arlington', 'VA', '74893-8432', '(304) 384-8832');
INSERT INTO tblPatrons
VALUES ('600-58-4323', 'Jackson', 'Jackie', '7389 Center St.', 'Spokane', 'WA', '57893-8734', '(505) 432-9758');
INSERT INTO tblPatrons
VALUES ('742-33-4872', 'Gettit', 'Willie', '437 WantMore St.', 'Colombus', 'GA', '66544-4453', '(303) 544-7545');

INSERT INTO tblPublishers
VALUES ('A', 'Atheneum', '9437 North Dodge Rd.', 'New York', 'NY', '10158-', '(193) 876-3456', '(193) 345-8765');
INSERT INTO tblPublishers
VALUES ('AAB', 'Allyn and Bacon, Inc.', '4500 Bilbo Dr.', 'Boston', 'MA', '67469-', '(192) 344-8500', '(192) 344-8501');
INSERT INTO tblPublishers
VALUES ('AAK', 'Alfred A. Knopf, Inc', '5757 Apple St', 'New York', 'NY', '10158-', '(193) 894-1234', '(193) 894-1200');
INSERT INTO tblPublishers
VALUES ('AB', 'Airmont Books', '401 Lafayette St.', 'New York', 'NY', '10003-', '(315) 293-2178', '(315) 293-2178');
INSERT INTO tblPublishers
VALUES ('ABD', 'Anchor Books Double Day, Inc.', '5678 Book Rd.', 'Garden City', 'NY', '10158-', '(193) 800-5431', '(193) 820-5400');
INSERT INTO tblPublishers
VALUES ('AP', 'Ace Publishing', '411 Lafayette St.', 'New York', 'NY', '10003-', '(421) 332-9456',  '(421) 332-4784');
INSERT INTO tblPublishers
VALUES ('APC', 'Applebee Publishing Company', '400 West 23rd Street', 'New York', 'NY', '10110-', '(421) 398-3939', '(421) 398-3939');
INSERT INTO tblPublishers
VALUES ('ATS', 'American Technical Society', 'P.O. Box 3', 'Chicago', 'IL', '51098-', '(708) 899-9315', '(708) 899-9452');
INSERT INTO tblPublishers
VALUES ('CMP', 'Charles E. Merril Publishing', '5206 Broadway', 'Columbus', 'OH', '43216-', '(614) 227-8080', '(614) 227-9231');
INSERT INTO tblPublishers
VALUES ('CPC', 'Clarendon Press Co.', '1234 West South St.', 'Cityville', 'WA', '49724-', '(515) 876-9999', '(515) 876-9090');
INSERT INTO tblPublishers
VALUES ('CPG', 'Carol Publishing Group', '600 Madison Avenue', 'New York', 'NY', '10022-', '(212) 462-2222', '(718) 241-3461');
INSERT INTO tblPublishers
VALUES ('CUP', 'Cornell University', '124 Roberts Place', 'Ithaca', 'NY', '14850-', '(193) 815-4000', '(193) 815-7723');
INSERT INTO tblPublishers
VALUES ('FP', 'The Free Press', '866 Third Avenue', 'New York', 'NY', '10022-', '(212) 462-4142', '(212) 435-5313');
INSERT INTO tblPublishers
VALUES ('FPI', 'Fairchild Publications, Inc.', '305 4th Avenue', 'New York', 'NY', '10110-', '(315) 432-4524', '(315) 534-3465');
INSERT INTO tblPublishers
VALUES ('FWEW', 'Four Walls Eight Windows', '1234 North 16 St.', 'New York', 'NY', '10158-', '(193) 582-4097', '(193) 582-5694');
INSERT INTO tblPublishers
VALUES ('GAP', 'Goodwrench Associated Pub.', '8700 Shoal Avenue', 'Austin', 'TX', '78758-', '(512) 525-2552', '(421) 385-4273');
INSERT INTO tblPublishers
VALUES ('GHBCI', 'McGraw-Hill Book Company, Inc.', '601 Madison Avenue', 'New York', 'NY', '10022-', '(212) 232-4414', '(718) 435-2223');
INSERT INTO tblPublishers
VALUES ('GKH', 'G. K. Hall', '510 West Clark St.', 'Boston', 'MA', '67468-', '(192) 344-8787', '(192) 344-8788');
INSERT INTO tblPublishers
VALUES ('GP', 'Guilford Press', '72 Spring St.', 'New York', 'NY', '10012-', '(193) 800-4500', '(193) 800-4501');
INSERT INTO tblPublishers
VALUES ('GRC', 'Gale Research Company', '896 South Zebra St.', 'Detroit', 'MI', '48226-', '(435) 789-3454', '(435) 789-6492');
INSERT INTO tblPublishers
VALUES ('HM', 'Houton Mifflin Co.', '823 East Horrace', 'Dallas', 'TX', '75202-', '(214) 812-3612', '(214) 812-3721');
INSERT INTO tblPublishers
VALUES ('HMC', 'Houghton Mifflin Company', '66 Massacre Drive', 'Boston', 'MA', '31067-', '(617) 465-3521', '(617) 465-3654');
INSERT INTO tblPublishers
VALUES ('HP', 'Halsted Press', '8745 South Maple St.', 'New York', 'NY', '10158-', '(193) 465-5034', '(193) 465-8769');
INSERT INTO tblPublishers
VALUES ('HRW', 'Holt, Rinehart, And Winston Ltd.', '789 W. Rockwood Ave.', 'New York', 'NY', '98754-', '(193) 800-7890', '(193) 800-9010');
INSERT INTO tblPublishers
VALUES ('HU', 'Harvard University Press', '1414 West Rd.', 'Cambridge', 'MA', '78904-', '(192) 941-5687', '(192) 941-5690');
INSERT INTO tblPublishers
VALUES ('HUP', 'Harvard University Press', 'P.O. BOX 9', 'Cambridge', 'MA', '31045-', '(617) 781-4587', '(617) 781-2394');
INSERT INTO tblPublishers
VALUES ('JB', 'Jossey Bass Inc.', '217 w 35 St.', 'SanFransico', 'CA', '94111-', '(415) 627-9904', '(415) 627-8972');
INSERT INTO tblPublishers
VALUES ('JW', 'John Wiley And Sons, Inc.', '860 Third Avenue', 'New York', 'NY', '10022-', '(212) 462-5859', '(718) 258-4659');
INSERT INTO tblPublishers
VALUES ('JWS', 'John Wiley and Sons', '874 West Ida St.', 'New York', 'NY', '10158-', '(193) 432-3333', '(193) 432-8411');
INSERT INTO tblPublishers
VALUES ('LA', 'Library of America', '111 Big Apple Road', 'New York', 'NY', '10003-', '(315) 643-8723', '(315) 643-9654');
INSERT INTO tblPublishers
VALUES ('LBC', 'Little Brown And Company', '127 Boston Tea St.', 'Boston', 'MA', '31066-', '(617) 466-3912', '(617) 466-3912');
INSERT INTO tblPublishers
VALUES ('Lgman', 'The Longman Inc.', '95 Church Street', 'White Plains', 'NY', '10601-', '(914) 961-7991', '(914) 435-4146');
INSERT INTO tblPublishers
VALUES ('LSP', 'Lousiana State Press', '1456 S. Chicken St.', 'New Orleans', 'LO', '85600-', '(456) 750-0350', '(456) 750-0351');
INSERT INTO tblPublishers
VALUES ('LUI', 'Libraries Unlimited, Inc.', 'P.O. Box 3988', 'Englewood', 'CO', '80155-', '(303) 924-6718', '(303) 924-4562');
INSERT INTO tblPublishers
VALUES ('MCIP', 'McFarland And Company, Inc. Pub.', 'P.O. Box 611', 'Jefferson', 'NC', '28640-', '(704) 281-4532', '(704) 281-2354');
INSERT INTO tblPublishers
VALUES ('MHBS', 'McGraw Hill Book Company', 'P.O. Box 38567', 'St. Louis', 'MO', '61124-', '(314) 482-7864', '(314) 482-4856');
INSERT INTO tblPublishers
VALUES ('MIT', 'Massachusetts Inst. of Tech', '3501 Benington Rd.', 'Cambridge', 'MA', '02021-', '(617) 627-2791', '(617) 627-9999');
INSERT INTO tblPublishers
VALUES ('MPC', 'Meredith Press Co.', '56 Hilghland Rd.', 'New Town', 'TN', '10094-', '(515) 982-1054', '(515) 982-1092');
INSERT INTO tblPublishers
VALUES ('NAS', 'National Assoc. of Secondary', '16780 Dead Drive', 'Ruston', 'VI', '60578-', '(689) 500-4325', '(689) 500-4326');
INSERT INTO tblPublishers
VALUES ('NDP', 'Noonday Press', '19 Union Square West', 'New York', 'NY', '10003-', '(315) 534-7563', '(315) 534-5402');
INSERT INTO tblPublishers
VALUES ('NP', 'Nichols Publishing', 'P.O. Box 96', 'New York', 'NY', '10024-', '(315) 666-3945', '(315) 666-5423');
INSERT INTO tblPublishers
VALUES ('NPC', 'Newton Publishing Company', '386 Fourth Ave.', 'New York', 'NY', '10024-', '(315) 482-3542', '(315) 482-4578');
INSERT INTO tblPublishers
VALUES ('OB', 'Octagon Books', '19 Union Square West', 'New York', 'NY', '10158-', '(193) 800-5000', '(193) 800-5600');
INSERT INTO tblPublishers
VALUES ('OSP', 'Oxford Science Publications', '865 Third Avenue', 'New York', 'NY', '10022-', '(718) 435-4464', '(718) 222-3323');
INSERT INTO tblPublishers
VALUES ('OUP', 'Oxford University Press', '200 Madison Avenue', 'New York', 'NY', '10110-', '(315) 435-3246', '(315) 435-6523');
INSERT INTO tblPublishers
VALUES ('PB', 'Penguin Books', '40 West 23rd Street', 'New York', 'NY', '10110-', '(315) 478-4321', '(315) 478-7240');
INSERT INTO tblPublishers
VALUES ('PH', 'Prentice-Hall, Inc.', '76 East Lane', 'Englewood Cliffs', 'NJ', '98000-', '(195) 032-9184', '(195) 032-1254');
INSERT INTO tblPublishers
VALUES ('PP', 'Praeger Publishers', 'One Madison Avenue', 'New York', 'NY', '10010-', '(193) 807-5600', '(193) 807-5601');
INSERT INTO tblPublishers
VALUES ('PRO', 'Proed', '8700 Shoal Avenue', 'Austin', 'TX', '78758-', '(512) 525-2552', '(512) 582-3312');
INSERT INTO tblPublishers
VALUES ('PSP', 'Pig Skin Press Co.', '111 Pig Pen Dr.', 'Farmville', 'IA', '50875-', '(515) 986-0091', '(515) 986-1002');
INSERT INTO tblPublishers
VALUES ('SFC', 'Scott Foresman and Co.', '1232 N. Englewood', 'Dallas', 'TX', '75215-', '(214) 702-5503', '(214) 702-9732');
INSERT INTO tblPublishers
VALUES ('SP', 'Scarecrow Press Inc.', '666 Satan Dr.', 'Metuchen', 'NJ', '98746-', '(195) 666-6666', '(195) 666-6667');
INSERT INTO tblPublishers
VALUES ('TDP', 'The Dryden Press', '67th Street', 'Orlando', 'FL', '87883-', '(495) 671-8497', '(495) 671-8497');
INSERT INTO tblPublishers
VALUES ('TWP', 'The Westminster Press', '999 West 5th St.', 'Lostinwoods', 'MO', '64587-', '(816) 862-9954', '(816) 862-8634');
INSERT INTO tblPublishers
VALUES ('UOP', 'University of Oklahoma Press', '453 University Drive', 'Oklahoma City', 'OK', '45327-', '(405) 324-4952', '(405) 324-4532');
INSERT INTO tblPublishers
VALUES ('VNR', 'Van Nostrand Reinhold', '222 Madison Square', 'New York', 'NY', '10023-', '(315) 293-4949', '(315) 293-4949');
INSERT INTO tblPublishers
VALUES ('VP', 'Viking Press', '345 Davidson Drive', 'New York', 'NY', '10110-', '(315) 467-2346', '(315) 423-1254');
INSERT INTO tblPublishers
VALUES ('WMH', 'Windcrest/McGraw-Hill', '342 East Center St.', 'New York', 'NY', '10158-', '(193) 402-4304', '(193) 402-3693');
INSERT INTO tblPublishers
VALUES ('WP', 'Whitston Publishing Company', '201 East Main St.', 'Troy', 'NY', '10158-', '(193) 542-5000', '(193) 542-4444');
INSERT INTO tblPublishers
VALUES ('WWNC', 'W.W. Norton And Company', '500 Fifth', 'New York', 'NY', '10110-', '(315) 524-4735', '(315) 482-3863');
INSERT INTO tblPublishers
VALUES ('WWP', 'Wide World Publishing', 'P.O. Box 746', 'San Carlos', 'CA', '94070-', '(916) 582-3313', '(512) 515-7927');

INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0029303303', 'Sowell', 'Thomas', 'Inside American Education', 18.95, 'FP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('007044883', 'Murray', 'Jerome', 'Expert Systems in Data Processing', 117.00, 'MHBS');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0070530149', 'Rimmer', 'Steve', 'Planet Internet', 12.50, 'WMH');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0080651194', 'Moore', 'Margaret', 'Understanding British English', 12.95, 'CPG');
INSERT INTO tblBooks
VALUES ('0132968983', 'Malamud', 'Carl', 'Exploring The Internet', 26.95, 'PH', '534-76-9428', 	TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks
VALUES ('0192814419', 'Shakespeare', 'William', 'Macbeth', 20.50, 'OUP', '503-43-9932', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0198111541', 'Shakespeare', 'William', 'Julius Caesar', 20.50, 'OUP');
INSERT INTO tblBooks
VALUES ('0198534361', 'Berberian', 'Sterling', 'Linear Algebra', 9.95, 'OSP', '000-00-0001', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0205069525', 'Hubert', 'Hoffman', 'Meaningfuy Movement for Children', 18.95, 'AAB');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0262120259', 'Lehiste', 'Isle', 'Reading in Acoustic Phonetics', 15.99, 'MIT');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0275936244', 'Lenz', 'Allen', 'Beyond Blue Economic Horizons', 19.50, 'PP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0307500112959', 'Wiley', 'Margaret', 'The Subtle Knot', 14.57, 'HU');
INSERT INTO tblBooks
VALUES ('0316542261', 'Mack', 'Alison', 'Dry All Night', 75.99, 'LBC', '495-72-3387', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0374522898', 'Sophocles', 'Sophocles', 'The Cure at Troy', 9.99, 'NDP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0374901538', 'Allen', 'Don', 'The Star Crossed Renissance', 19.00, 'OB');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0395175801', 'Shertzer', 'Bruce', 'Fundamentals of Counseling', 35.99, 'HM');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0395243033', 'Price', 'Richard', 'Bloodbrothers', 39.39, 'HMC');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0471530336', 'Engholm', 'Christopher', 'When Business East Meets Business West', 19.95, 'JW');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('047190063X', 'Davies', 'Donald', 'Security for Computer Networks', 23.95, 'JWS');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0521220106', 'Sophocles', 'Sophocles', 'Electra,Antigone,Philoctetes', 15.26, 'CUP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0582285712', 'Spring', 'Joel', 'The American School', 13.95, 'Lgman');
INSERT INTO tblBooks
VALUES ('0658855399', 'Schwartz', 'Arnold', 'Dynamic Professional Selling', 25.00, 'NP', '488-37-2848', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0659204783', 'Monagham', 'Patrick', 'Public Relations And Careers', 7.95, 'FPI');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0673077152', 'Palermo', 'David', 'Psychology of Language', 26.95, 'SFC');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0674005805', 'Comanor', 'William', 'Advertising and Market Power', 16.00, 'HUP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0675089174', 'Severinson', 'Norman', 'Career Guidance', 18.99, 'CMP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0689705336', 'Lanes', 'Selma', 'Down the Rabbit Hole', 25.50, 'A');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0693754322', 'Halperin', 'Don', 'Building with Steel', 23.00, 'ATS');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0801426170', 'Ronald', 'Libby', 'Protecting Markets', 15.90, 'CUP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0801838665', 'Palmer', 'Risa', 'Natural Hazards', 14.99, 'CMP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0804900035', 'Crane', 'Stephen', 'The Red Badge of Courage', 2.25, 'AB');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0807105716', 'Jacoway', 'Elizabeth', 'Yankee Missionaries in the South', 5.90, 'LSP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0810821745', 'Harnly', 'Caroline', 'Agent Orange and Vietnam', 17.50, 'SP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0816189668', 'Cooper', 'Thomas', 'Television and Ethics', 12.50, 'GKH');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0817303235', 'Reeves', 'Tom', 'The Politics of the Peace Corps', 25.99, 'AAB');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0850594308', 'Heath', 'Ian', 'A Warmonger''s Guide to the Crusades', 25.00, 'APC');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0853127131097', 'Turner', 'Raymand', 'Logics for Artificial Intelligence', 10.99, 'HP');
INSERT INTO tblBooks
VALUES ('0853348200', 'Vlitos', 'A.J.', 'Developments in Sweetners', 17.50, 'GAP', '495-72-3387', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0865317291', 'Taylor', 'Robert', 'Military Leadership', 17.50, 'GP');
INSERT INTO tblBooks
VALUES ('0872876365', 'Lambert', 'Shirley', 'Clipart And Dynamic Designs', 45.00, 'LUI', '506-43-7823', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0874711312', 'Parry', 'Geraint', 'Participation in Politics', 18.25, 'GP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0875892272', 'Henderson', 'algo', 'Higher Education In America', 27.99, 'JB');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('087875024X', 'Floyd', 'Mary', 'Abortion Bibliography for 1970', 28.50, 'WP');
INSERT INTO tblBooks
VALUES ('0879751614', 'Stojanovic', 'Svetozar', 'In Search of Clamoracy in Socialism', 15.00, 'HM', '501-83-2285', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('088212125', 'Lounsbury', 'John', 'Life in Three Sixth Grades', 22.50, 'NAS');
INSERT INTO tblBooks
VALUES ('0890795436', 'Wilson', 'Meg', 'Options For Girls', 9.95, 'PRO', '505-45-7293', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('089950633X', 'McEwan', 'Barbara', 'Thomas Jefferson:  Farmer', 45.00, 'MCIP');
INSERT INTO tblBooks
VALUES ('0920437832', 'Williams', 'Henry', 'The Great Astronomers', 35.00, 'NPC', '742-33-4872', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0932790224', 'Baird', 'Charles', 'Pest Control', 10.75, 'HM');
INSERT INTO tblBooks
VALUES ('0933174993', 'Theoni', 'Pappas', 'The Magic Of Mathematics', 8.75, 'WWP', '000-00-0001', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0940450186', 'Poe', 'Edger Allan', 'Poetry and Tales', 51.50, 'VP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('0940450828', 'Twain', 'Mark', 'Historical Romances', 19.99, 'LA');
INSERT INTO tblBooks
VALUES ('0970004352', 'Laubin', 'Reginald', 'Indian Dances of North America', 25.00, 'UOP', '600-58-4323', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('101010101010', 'Smith', 'Howard', 'Computers and Society', 30.00, 'VNR');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('1024599877677', 'Mitford', 'Jessica', 'Cencored', 9.97, 'FWEW');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('10399876543', 'Brigham', 'Eugene', 'Immediate Finance Management', 35.00, 'TDP');
INSERT INTO tblBooks
VALUES ('3070000889965', 'Smith', 'Howard', 'Chinese Religions', 2.45, 'HRW', '742-33-4872', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks
VALUES ('3075000118209', 'Heidel', 'Alexander', 'The Babylonian Genesis', 6.95, 'HRW', '499-45-8832', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks
VALUES ('307500027205T', 'O''Connor', 'D.J.', 'Free Will', 25.80, 'ABD', '503-53-8884', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('307500029201T', 'Evans', 'Bergen', 'The Natural History of Nonsense', 7.89, 'AAK');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('307500033303R', 'Hornstein', 'Harvey', 'Cruelty and Kindness', 7.94, 'PH');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('307500033512T', 'Kittredge', 'George', 'Witchcraft in Old and New England', 13.50, 'HU');
INSERT INTO tblBooks
VALUES ('3075000592656', 'Williams', 'George', 'The Radical Reformation', 24.95, 'TWP', '501-45-6543', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks
VALUES ('3075000668192', 'Marty', 'Martin', 'What Do You Believe?', 18.95, 'MPC', '484-84-3028', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075001030336', 'Mellinkoff', 'Ruth', 'Horned Mises in Medieval Art', 19.99, 'PSP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075001048289', 'Idowa', 'Balaji', 'African Traditional Religions', 5.95, 'PSP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075001048367', 'Lewis', 'Bernard', 'The Jews of Islam', 4.99, 'CPC');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075001178986', 'Lawther', 'John', 'The Learning And Performance of Skills', 8.95, 'PH');
INSERT INTO tblBooks
VALUES ('307500149630', 'YoungEisendrat', 'Polly', 'Female Authority', 15.89, 'GP', '505-83-8932', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075001690963', 'Rosen', 'Raymond', 'Patterns of Sexual Arousal', 12.50, 'GP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075001842904', 'Dexter', 'Miriam', 'Whence the Goddesses', 8.95, 'HRW');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075001919208', 'Cameron', 'Euan', 'The European Reformation', 12.95, 'CPC');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3075002146881', 'Freidel', 'David', 'Maya Cosmos', 10.99, 'TWP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('3111111111111', 'Smith', 'Howard', 'Great Religions', 25.00, 'PB');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('35455318764', 'Elledge', 'Scott', 'E.B. White A Biography', 52.00, 'WWNC');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('370.973 S25A', 'Woodring', 'Paul', 'American Education Today', 15.00, 'GHBCI');
INSERT INTO tblBooks
VALUES ('6189234529', 'Shafer', 'Charles', 'Childhood Encopresis and Enuresis', 2.00, 'VNR', '506-43-7823', TO_DATE('1996-04-02', 'YYYY-MM-DD'));
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('90985754434', 'Hershman', 'Jablow', 'A Brotherhood of Tyrants', 27.38, 'AP');
INSERT INTO tblBooks(ISBN, AuthLastName, AuthFirstName, Title, Price, PubId)
VALUES ('99408323673', 'Ardagh', 'John', 'France in the 1980''s', 35.00, 'PB');

INSERT INTO tblKeywords
VALUES('99408323673', '1980''s');
INSERT INTO tblKeywords
VALUES('087875024X', 'Abortion');
INSERT INTO tblKeywords
VALUES('0674005805', 'Advertising');
INSERT INTO tblKeywords
VALUES('3075001048289', 'Africa');
INSERT INTO tblKeywords
VALUES('0198534361', 'Algebra');
INSERT INTO tblKeywords
VALUES('0029303303', 'American');
INSERT INTO tblKeywords
VALUES('0582285712', 'American');
INSERT INTO tblKeywords
VALUES('370.973 S25A', 'American');
INSERT INTO tblKeywords
VALUES('0262120259', 'Analysis');
INSERT INTO tblKeywords
VALUES('0521220106', 'Antigone');
INSERT INTO tblKeywords
VALUES('3075001030336', 'Art');
INSERT INTO tblKeywords
VALUES('0374901538', 'Astrology');
INSERT INTO tblKeywords
VALUES('0920437832', 'Astronomy');
INSERT INTO tblKeywords
VALUES('0374901538', 'Astronomy');
INSERT INTO tblKeywords
VALUES('35455318764', 'Author');
INSERT INTO tblKeywords
VALUES('3075000118209', 'Babylonian');
INSERT INTO tblKeywords
VALUES('0316542261', 'Bedwetting');
INSERT INTO tblKeywords
VALUES('3075000668192', 'Beliefs');
INSERT INTO tblKeywords
VALUES('35455318764', 'Biography');
INSERT INTO tblKeywords
VALUES('0080651194', 'British');
INSERT INTO tblKeywords
VALUES('0471530336', 'Business');
INSERT INTO tblKeywords
VALUES('0658855399', 'Business');
INSERT INTO tblKeywords
VALUES('0659204783', 'Business');
INSERT INTO tblKeywords
VALUES('0801426170', 'Business');
INSERT INTO tblKeywords
VALUES('0675089174', 'Career');
INSERT INTO tblKeywords
VALUES('1024599877677', 'Censorship');
INSERT INTO tblKeywords
VALUES('0810821745', 'Chemicals');
INSERT INTO tblKeywords
VALUES('0205069525', 'Children');
INSERT INTO tblKeywords
VALUES('3070000889965', 'Chinese');
INSERT INTO tblKeywords
VALUES('0804900035', 'Civil War');
INSERT INTO tblKeywords
VALUES('0872876365', 'Clipart');
INSERT INTO tblKeywords
VALUES('0875892272', 'College');
INSERT INTO tblKeywords
VALUES('0132968983', 'Computers');
INSERT INTO tblKeywords
VALUES('047190063X', 'Computers');
INSERT INTO tblKeywords
VALUES('0070530149', 'Computers');
INSERT INTO tblKeywords
VALUES('0853127131097', 'Computers');
INSERT INTO tblKeywords
VALUES('6189234529', 'Constipation');
INSERT INTO tblKeywords
VALUES('0693754322', 'Construction');
INSERT INTO tblKeywords
VALUES('0395175801', 'Counseling');
INSERT INTO tblKeywords
VALUES('307500033303R', 'Cruelty');
INSERT INTO tblKeywords
VALUES('0850594308', 'Crusades');
INSERT INTO tblKeywords
VALUES('007044883', 'DataProcessing');
INSERT INTO tblKeywords
VALUES('0932790224', 'Death');
INSERT INTO tblKeywords
VALUES('0872876365', 'Designs');
INSERT INTO tblKeywords
VALUES('0205069525', 'Development');
INSERT INTO tblKeywords
VALUES('0801838665', 'Disasters');
INSERT INTO tblKeywords
VALUES('0275936244', 'Economics');
INSERT INTO tblKeywords
VALUES('0029303303', 'Education');
INSERT INTO tblKeywords
VALUES('0875892272', 'Education');
INSERT INTO tblKeywords
VALUES('370.973 S25A', 'Education');
INSERT INTO tblKeywords
VALUES('0521220106', 'Electra');
INSERT INTO tblKeywords
VALUES('088212125', 'Elementary');
INSERT INTO tblKeywords
VALUES('6189234529', 'Encopresis');
INSERT INTO tblKeywords
VALUES('0080651194', 'English');
INSERT INTO tblKeywords
VALUES('0316542261', 'Enuresis');
INSERT INTO tblKeywords
VALUES('0816189668', 'Ethics');
INSERT INTO tblKeywords
VALUES('087875024X', 'Ethics');
INSERT INTO tblKeywords
VALUES('0689705336', 'Fantasy');
INSERT INTO tblKeywords
VALUES('089950633X', 'Farming');
INSERT INTO tblKeywords
VALUES('0801426170', 'Finance');
INSERT INTO tblKeywords
VALUES('10399876543', 'Finance');
INSERT INTO tblKeywords
VALUES('0970004352', 'FolkDance');
INSERT INTO tblKeywords
VALUES('99408323673', 'France');
INSERT INTO tblKeywords
VALUES('0890795436', 'Girls');
INSERT INTO tblKeywords
VALUES('3075001842904', 'Goddesses');
INSERT INTO tblKeywords
VALUES('0865317291', 'Government');
INSERT INTO tblKeywords
VALUES('0874711312', 'Government');
INSERT INTO tblKeywords
VALUES('0879751614', 'Government');
INSERT INTO tblKeywords
VALUES('0395175801', 'Guidance');
INSERT INTO tblKeywords
VALUES('0675089174', 'Guidance');
INSERT INTO tblKeywords
VALUES('0850594308', 'History');
INSERT INTO tblKeywords
VALUES('0920437832', 'History');
INSERT INTO tblKeywords
VALUES('90985754434', 'Hitler');
INSERT INTO tblKeywords
VALUES('0395243033', 'human nature');
INSERT INTO tblKeywords
VALUES('0970004352', 'Indians');
INSERT INTO tblKeywords
VALUES('0070530149', 'Internet');
INSERT INTO tblKeywords
VALUES('089950633X', 'Jefferson');
INSERT INTO tblKeywords
VALUES('0940450828', 'Joan of Arc');
INSERT INTO tblKeywords
VALUES('3075001048367', 'Judaism');
INSERT INTO tblKeywords
VALUES('0940450828', 'King Arthur');
INSERT INTO tblKeywords
VALUES('0673077152', 'Language');
INSERT INTO tblKeywords
VALUES('3075001178986', 'Learning');
INSERT INTO tblKeywords
VALUES('0198534361', 'Linear');
INSERT INTO tblKeywords
VALUES('0853127131097', 'Logics');
INSERT INTO tblKeywords
VALUES('0933174993', 'Magic');
INSERT INTO tblKeywords
VALUES('10399876543', 'Management');
INSERT INTO tblKeywords
VALUES('0674005805', 'Marketing');
INSERT INTO tblKeywords
VALUES('0933174993', 'Mathematics');
INSERT INTO tblKeywords
VALUES('3075002146881', 'Maya');
INSERT INTO tblKeywords
VALUES('90985754434', 'Mental health');
INSERT INTO tblKeywords
VALUES('0865317291', 'Military');
INSERT INTO tblKeywords
VALUES('0801838665', 'Nature');
INSERT INTO tblKeywords
VALUES('0132968983', 'Network');
INSERT INTO tblKeywords
VALUES('1024599877677', 'News');
INSERT INTO tblKeywords
VALUES('307500033512T', 'Occult');
INSERT INTO tblKeywords
VALUES('0890795436', 'Options');
INSERT INTO tblKeywords
VALUES('0817303235', 'Peace Corps');
INSERT INTO tblKeywords
VALUES('0932790224', 'Pest');
INSERT INTO tblKeywords
VALUES('0374522898', 'Philoctetes');
INSERT INTO tblKeywords
VALUES('307500027205T', 'Philosophy');
INSERT INTO tblKeywords
VALUES('0307500112959', 'Philosophy');
INSERT INTO tblKeywords
VALUES('0940450186', 'Poe poetry');
INSERT INTO tblKeywords
VALUES('0940450186', 'Poe tales');
INSERT INTO tblKeywords
VALUES('0817303235', 'Politics');
INSERT INTO tblKeywords
VALUES('0874711312', 'Politics');
INSERT INTO tblKeywords
VALUES('0879751614', 'Politics');
INSERT INTO tblKeywords
VALUES('307500033303R', 'Psychology');
INSERT INTO tblKeywords
VALUES('307500149630', 'Psychology');
INSERT INTO tblKeywords
VALUES('3075001690963', 'Psychology');
INSERT INTO tblKeywords
VALUES('0673077152', 'Psychology');
INSERT INTO tblKeywords
VALUES('3075001178986', 'Psychology');
INSERT INTO tblKeywords
VALUES('0659204783', 'PublicRelation');
INSERT INTO tblKeywords
VALUES('0689705336', 'Rabbit');
INSERT INTO tblKeywords
VALUES('3075000592656', 'Reformation');
INSERT INTO tblKeywords
VALUES('3075001919208', 'Reformation');
INSERT INTO tblKeywords
VALUES('3070000889965', 'Religion');
INSERT INTO tblKeywords
VALUES('3075000118209', 'Religion');
INSERT INTO tblKeywords
VALUES('3075000592656', 'Religion');
INSERT INTO tblKeywords
VALUES('3075000668192', 'Religion');
INSERT INTO tblKeywords
VALUES('3075001030336', 'Religion');
INSERT INTO tblKeywords
VALUES('3075001048289', 'Religion');
INSERT INTO tblKeywords
VALUES('3075001048367', 'Religion');
INSERT INTO tblKeywords
VALUES('3075001842904', 'Religion');
INSERT INTO tblKeywords
VALUES('3075001919208', 'Religion');
INSERT INTO tblKeywords
VALUES('3075002146881', 'Religion');
INSERT INTO tblKeywords
VALUES('0807105716', 'Religion');
INSERT INTO tblKeywords
VALUES('307500027205T', 'Religion');
INSERT INTO tblKeywords
VALUES('3111111111111', 'Religion');
INSERT INTO tblKeywords
VALUES('0853348200', 'Research');
INSERT INTO tblKeywords
VALUES('0395243033', 'Richard Price');
INSERT INTO tblKeywords
VALUES('0658855399', 'Sales');
INSERT INTO tblKeywords
VALUES('0307500112959', 'Scepticism');
INSERT INTO tblKeywords
VALUES('088212125', 'School');
INSERT INTO tblKeywords
VALUES('0582285712', 'School');
INSERT INTO tblKeywords
VALUES('047190063X', 'Security');
INSERT INTO tblKeywords
VALUES('3075001690963', 'Sexuality');
INSERT INTO tblKeywords
VALUES('0192814419', 'Shakespeare');
INSERT INTO tblKeywords
VALUES('0198111541', 'Shakespeare');
INSERT INTO tblKeywords
VALUES('0275936244', 'Sky');
INSERT INTO tblKeywords
VALUES('0262120259', 'Sound');
INSERT INTO tblKeywords
VALUES('0807105716', 'South');
INSERT INTO tblKeywords
VALUES('0693754322', 'Steel');
INSERT INTO tblKeywords
VALUES('307500029201T', 'Stupid');
INSERT INTO tblKeywords
VALUES('0853348200', 'Sugar');
INSERT INTO tblKeywords
VALUES('007044883', 'Systems');
INSERT INTO tblKeywords
VALUES('0816189668', 'Television');
INSERT INTO tblKeywords
VALUES('3111111111111', 'Theology');
INSERT INTO tblKeywords
VALUES('0192814419', 'tragedy');
INSERT INTO tblKeywords
VALUES('0198111541', 'tragedy');
INSERT INTO tblKeywords
VALUES('0374522898', 'Trojan War');
INSERT INTO tblKeywords
VALUES('0810821745', 'Vietnam');
INSERT INTO tblKeywords
VALUES('0804900035', 'War');
INSERT INTO tblKeywords
VALUES('307500029201T', 'Weird');
INSERT INTO tblKeywords
VALUES('0471530336', 'West');
INSERT INTO tblKeywords
VALUES('307500033512T', 'Wicca');
INSERT INTO tblKeywords
VALUES('307500149630', 'Women');

INSERT INTO tblInterests
VALUES ('000-00-0001', 'Mathematics');
INSERT INTO tblInterests
VALUES ('000-00-0001', 'Religion');
INSERT INTO tblInterests
VALUES ('372-97-3427', 'Language');
INSERT INTO tblInterests
VALUES ('372-97-3427', 'Medicine');
INSERT INTO tblInterests
VALUES ('372-97-3427', 'Nature');
INSERT INTO tblInterests
VALUES ('484-84-3028', 'English');
INSERT INTO tblInterests
VALUES ('484-84-3028', 'Learning');
INSERT INTO tblInterests
VALUES ('484-84-3028', 'Nature');
INSERT INTO tblInterests
VALUES ('488-37-2848', 'Advertising');
INSERT INTO tblInterests
VALUES ('488-37-2848', 'Education');
INSERT INTO tblInterests
VALUES ('490-12-7374', 'Analysis');
INSERT INTO tblInterests
VALUES ('490-12-7374', 'Disasters');
INSERT INTO tblInterests
VALUES ('490-12-7374', 'Music');
INSERT INTO tblInterests
VALUES ('495-72-3387', 'Civil War');
INSERT INTO tblInterests
VALUES ('495-72-3387', 'Education');
INSERT INTO tblInterests
VALUES ('495-72-3387', 'Technology');
INSERT INTO tblInterests
VALUES ('499-45-8832', 'Africa');
INSERT INTO tblInterests
VALUES ('499-45-8832', 'Foreign Affairs');
INSERT INTO tblInterests
VALUES ('500-53-4231', 'Advertising');
INSERT INTO tblInterests
VALUES ('500-53-4231', 'Marketing');
INSERT INTO tblInterests
VALUES ('500-53-4231', 'Public Relation');
INSERT INTO tblInterests
VALUES ('501-45-6543', 'Philosophy');
INSERT INTO tblInterests
VALUES ('501-45-6543', 'Reformation');
INSERT INTO tblInterests
VALUES ('501-45-6543', 'Renaissance');
INSERT INTO tblInterests
VALUES ('501-83-2285', 'College');
INSERT INTO tblInterests
VALUES ('501-83-2285', 'Government');
INSERT INTO tblInterests
VALUES ('501-83-2285', 'Politics');
INSERT INTO tblInterests
VALUES ('503-43-9932', 'Shakespeare');
INSERT INTO tblInterests
VALUES ('503-43-9932', 'Tragedy');
INSERT INTO tblInterests
VALUES ('503-53-8884', 'Ethics');
INSERT INTO tblInterests
VALUES ('503-53-8884', 'Goddesses');
INSERT INTO tblInterests
VALUES ('503-53-8884', 'Philosophy');
INSERT INTO tblInterests
VALUES ('505-45-7293', 'Sexuality');
INSERT INTO tblInterests
VALUES ('505-45-7293', 'Women');
INSERT INTO tblInterests
VALUES ('505-83-8932', 'Sexuality');
INSERT INTO tblInterests
VALUES ('505-83-8932', 'Women');
INSERT INTO tblInterests
VALUES ('506-43-7823', 'Literature');
INSERT INTO tblInterests
VALUES ('506-43-7823', 'Magic');
INSERT INTO tblInterests
VALUES ('510-67-9348', 'Dinosaurs');
INSERT INTO tblInterests
VALUES ('510-67-9348', 'Education');
INSERT INTO tblInterests
VALUES ('510-67-9348', 'Occult');
INSERT INTO tblInterests
VALUES ('520-65-8973', 'Designs');
INSERT INTO tblInterests
VALUES ('520-65-8973', 'Magic');
INSERT INTO tblInterests
VALUES ('520-65-8973', 'Technology');
INSERT INTO tblInterests
VALUES ('534-76-9428', 'Algebra');
INSERT INTO tblInterests
VALUES ('534-76-9428', 'Computers');
INSERT INTO tblInterests
VALUES ('534-76-9428', 'Logics');
INSERT INTO tblInterests
VALUES ('600-58-4323', 'FolkDance');
INSERT INTO tblInterests
VALUES ('600-58-4323', 'King Arthur');
INSERT INTO tblInterests
VALUES ('600-58-4323', 'Sports');
INSERT INTO tblInterests
VALUES ('742-33-4872', 'Astronomy');
INSERT INTO tblInterests
VALUES ('742-33-4872', 'Ethics');
INSERT INTO tblInterests
VALUES ('742-33-4872', 'Religion');

INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0029303303', TO_DATE('1993-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '007044883', TO_DATE('1993-02-03', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0070530149', TO_DATE('1993-03-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0080651194', TO_DATE('1993-04-03', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0132968983', TO_DATE('1993-05-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0192814419', TO_DATE('1993-06-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0198534361', TO_DATE('1993-07-06', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0198534361', TO_DATE('1994-03-03', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('000-00-0001', '0205069525', TO_DATE('1993-08-07', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0262120259', TO_DATE('1993-09-08', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0275936244', TO_DATE('1993-10-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0307500112959', TO_DATE('1993-11-10', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0316542261', TO_DATE('1993-12-11', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0374522898', TO_DATE('1994-01-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0374901538', TO_DATE('1994-02-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0395175801', TO_DATE('1994-03-02', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('372-97-3427', '0395243033', TO_DATE('1994-04-03', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '0029303303', TO_DATE('1994-07-06', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '007044883', TO_DATE('1994-08-07', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '0070530149', TO_DATE('1994-09-08', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '0080651194', TO_DATE('1994-10-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '0132968983', TO_DATE('1994-11-10', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '0192814419', TO_DATE('1994-12-11', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '0471530336', TO_DATE('1994-05-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('484-84-3028', '047190063X', TO_DATE('1994-06-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0198111541', TO_DATE('1993-01-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0198534361', TO_DATE('1993-02-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0205069525', TO_DATE('1993-03-06', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0262120259', TO_DATE('1993-04-07', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0275936244', TO_DATE('1993-05-08', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0307500112959', TO_DATE('1993-06-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0316542261', TO_DATE('1993-07-30', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('488-37-2848', '0374522898', TO_DATE('1993-08-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '0029303303', TO_DATE('1994-02-02', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '007044883', TO_DATE('1994-03-03', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '0070530149', TO_DATE('1994-05-17', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '0374901538', TO_DATE('1993-09-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '0395175801', TO_DATE('1993-10-22', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '0395243033', TO_DATE('1993-11-11', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '0471530336', TO_DATE('1993-12-24', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('490-12-7374', '047190063X', TO_DATE('1994-01-17', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0132968983', TO_DATE('1994-05-27', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0192814419', TO_DATE('1994-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0192814419', TO_DATE('1994-02-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0192814419', TO_DATE('1994-03-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0192814419', TO_DATE('1994-04-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0198534361', TO_DATE('1993-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0205069525', TO_DATE('1994-07-07', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0374522898', TO_DATE('1993-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '0395243033', TO_DATE('1993-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('495-72-3387', '047190063X', TO_DATE('1993-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0801426170', TO_DATE('1994-06-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0801838665', TO_DATE('1995-07-23', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0807105716', TO_DATE('1994-06-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0816189668', TO_DATE('1995-06-15', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0817303235', TO_DATE('1994-09-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0853127131097', TO_DATE('1996-01-19', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0853348200', TO_DATE('1995-04-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('500-53-4231', '0872876365', TO_DATE('1995-04-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-45-6543', '0850594308', TO_DATE('1994-01-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-45-6543', '087875024X', TO_DATE('1995-04-23', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-45-6543', '087875024X', TO_DATE('1995-08-29', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-45-6543', '0879751614', TO_DATE('1994-10-24', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-45-6543', '0879751614', TO_DATE('1995-07-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-45-6543', '0920437832', TO_DATE('1995-11-11', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-45-6543', '0933174993', TO_DATE('1994-01-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-83-2285', '0804900035', TO_DATE('1994-05-24', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-83-2285', '0810821745', TO_DATE('1994-01-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-83-2285', '0816189668', TO_DATE('1994-09-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-83-2285', '0850594308', TO_DATE('1994-08-26', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-83-2285', '0865317291', TO_DATE('1996-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-83-2285', '0933174993', TO_DATE('1995-09-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('501-83-2285', '0940450186', TO_DATE('1995-09-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '0801426170', TO_DATE('1994-02-02', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '0801838665', TO_DATE('1994-02-17', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '0816189668', TO_DATE('1994-08-15', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '0865317291', TO_DATE('1994-02-17', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '0875892272', TO_DATE('1995-06-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '0890795436', TO_DATE('1995-02-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '089950633X', TO_DATE('1994-06-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('503-53-8884', '089950633X', TO_DATE('1995-02-24', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '0804900035', TO_DATE('1995-11-11', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '0816189668', TO_DATE('1995-04-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '0853127131097', TO_DATE('1994-12-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '0853348200', TO_DATE('1995-04-13', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '0872876365', TO_DATE('1994-12-15', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '0875892272', TO_DATE('1996-01-19', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '087875024X', TO_DATE('1995-04-15', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '089950633X', TO_DATE('1994-10-11', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-45-7293', '0932790224', TO_DATE('1995-03-03', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0817303235', TO_DATE('1994-06-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0853348200', TO_DATE('1995-04-16', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0872876365', TO_DATE('1995-04-16', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '087875024X', TO_DATE('1995-08-24', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0890795436', TO_DATE('1994-04-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0890795436', TO_DATE('1995-02-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0932790224', TO_DATE('1994-12-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0940450186', TO_DATE('1994-02-13', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0940450828', TO_DATE('1995-07-14', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0970004352', TO_DATE('1995-02-13', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('505-83-8932', '0970004352', TO_DATE('1995-02-16', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '307500033512T', TO_DATE('1991-12-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '3075001030336', TO_DATE('1978-07-24', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '3075001048289', TO_DATE('1991-12-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '3075001178986', TO_DATE('1991-12-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '3075001690963', TO_DATE('1992-04-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '3075001842904', TO_DATE('1991-12-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '3075001919208', TO_DATE('1992-12-08', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '35455318764', TO_DATE('1992-12-10', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '6189234529', TO_DATE('1994-05-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '6189234529', TO_DATE('1994-07-13', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('506-43-7823', '99408323673', TO_DATE('1991-12-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '1024599877677', TO_DATE('1991-07-12', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '1024599877677', TO_DATE('1992-01-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '3075000118209', TO_DATE('1992-02-18', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '3075000118209', TO_DATE('1992-05-15', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '307500033512T', TO_DATE('1993-12-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '307500033512T', TO_DATE('1994-10-27', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '307500033512T', TO_DATE('1994-11-21', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '3075000592656', TO_DATE('1992-02-18', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '3075000668192', TO_DATE('1988-12-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '3075001048367', TO_DATE('1985-10-19', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('510-67-9348', '3075001919208', TO_DATE('1992-02-18', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('520-65-8973', '3070000889965', TO_DATE('1993-12-06', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('520-65-8973', '307500027205T', TO_DATE('1994-08-02', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('520-65-8973', '3075001048289', TO_DATE('1993-07-06', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('520-65-8973', '3075001690963', TO_DATE('1991-03-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('520-65-8973', '3075001842904', TO_DATE('1993-01-23', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('520-65-8973', '370.973 S25A', TO_DATE('1994-08-04', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('534-76-9428', '1024599877677', TO_DATE('1991-12-22', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('534-76-9428', '307500029201T', TO_DATE('1993-11-22', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('534-76-9428', '3075001048367', TO_DATE('1985-12-13', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('534-76-9428', '3075001178986', TO_DATE('1992-08-06', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('534-76-9428', '3075001842904', TO_DATE('1992-02-03', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('534-76-9428', '3075002146881', TO_DATE('1994-03-23', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('600-58-4323', '3075000118209', TO_DATE('1992-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('600-58-4323', '307500033303R', TO_DATE('1992-12-08', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('600-58-4323', '307500033512T', TO_DATE('1993-10-20', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('600-58-4323', '3075001842904', TO_DATE('1992-01-01', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('600-58-4323', '35455318764', TO_DATE('1993-12-09', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('600-58-4323', '90985754434', TO_DATE('1994-10-18', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('600-58-4323', '99408323673', TO_DATE('1994-09-13', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '307500027205T', TO_DATE('1994-05-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '307500033512T', TO_DATE('1994-05-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '3075000592656', TO_DATE('1993-11-21', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '3075001842904', TO_DATE('1993-02-21', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '3075002146881', TO_DATE('1993-12-19', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '370.973 S25A', TO_DATE('1994-05-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '90985754434', TO_DATE('1994-05-05', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '99408323673', TO_DATE('1994-01-23', 'YYYY-MM-DD'));
INSERT INTO tblHistoricalData
VALUES ('742-33-4872', '99408323673', TO_DATE('1994-10-04', 'YYYY-MM-DD'));

commit;

select * from tblBooks;