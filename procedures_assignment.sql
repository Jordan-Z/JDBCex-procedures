SET SERVEROUTPUT ON
DROP TABLE MyCrush;
DROP TABLE MyDetails;

CREATE TABLE MyCrush(
Crush_ID INTEGER,
Crush_Name VARCHAR2(30) NOT NULL,
Crush_Description VARCHAR2(10) NOT NULL,
PRIMARY KEY (Crush_ID));

INSERT into MYCRUSH (CRUSH_ID, CRUSH_NAME, CRUSH_DESCRIPTION) values (1, 'Blondie', 'Present');
INSERT into MYCRUSH (CRUSH_ID, CRUSH_NAME, CRUSH_DESCRIPTION) values (2, 'Sierra', 'Past');
INSERT into MYCRUSH (CRUSH_ID, CRUSH_NAME, CRUSH_DESCRIPTION) values (3, 'Taylor', 'Childhood');

CREATE TABLE MyDetails(
Student_ID INTEGER,
Student_Name VARCHAR2(10) NOT NULL,
Student_Term INTEGER,
Student_GPA DECIMAL(4, 2),
PRIMARY KEY (Student_ID, Student_Term));

INSERT into MyDetails (STUDENT_ID, STUDENT_NAME, STUDENT_TERM, STUDENT_GPA) values (521476, 'Jordan', 1, 3.54);
INSERT into MyDetails (STUDENT_ID, STUDENT_NAME, STUDENT_TERM, STUDENT_GPA) values (521476, 'Jordan', 2, 3.33);
INSERT into MyDetails (STUDENT_ID, STUDENT_NAME, STUDENT_TERM, STUDENT_GPA) values (521476, 'Jordan', 3, 3.25);
INSERT into MyDetails (STUDENT_ID, STUDENT_NAME, STUDENT_TERM, STUDENT_GPA) values (521476, 'Jordan', 4, 3.11);

SHOW ERRORS
--Question 1
Create or replace procedure getCrushName as
crush varchar2(30);
var1 varchar2(10);
BEGIN
var1 := '&name';
  CASE var1
    when 'Past' then
    select Crush_Name into crush from MyCrush where crush_description = 'Past';
    DBMS_OUTPUT.PUT_LINE('MY Crush name is '||crush);
    when 'Present' then
    select Crush_Name into crush from MyCrush where crush_description = 'Present';
    DBMS_OUTPUT.PUT_LINE('My Crush name is '||crush);
    when 'Childhood' then
    select Crush_Name into crush from MyCrush where crush_description = 'Childhood';
    DBMS_OUTPUT.PUT_LINE('My Crush name is '||crush);
    else
    DBMS_OUTPUT.PUT_LINE('I dont have a crush on anyone');
  END CASE;
END;
/
execute getCrushName();

--Question 2
Create or replace procedure calAvgGPA as
gpa1 decimal(4,2);
gpa2 decimal(4,2);
gpa3 decimal(4,2);
gpa4 decimal(4,2);
avgGPA decimal(4,2);
BEGIN
select Student_GPA into gpa1 from MyDetails where Student_Term = 1;
select Student_GPA into gpa2 from MyDetails where Student_Term = 2;
select Student_GPA into gpa3 from MyDetails where Student_Term = 3;
select Student_GPA into gpa4 from MyDetails where Student_Term = 4;
avgGPA := ((gpa1 + gpa2 + gpa3 + gpa4)/4);
DBMS_OUTPUT.PUT_LINE('Average GPA is:' ||avgGPA);
END;
/
execute calAvgGPA;

--Question 3
Create or replace function findAvgGPA
(gpa1 IN decimal, gpa2 IN decimal, gpa3 IN decimal, gpa4 IN decimal)
return decimal
IS
avgGPA decimal(4,2);
BEGIN
avgGPA := ((gpa1 + gpa2 + gpa3 + gpa4)/4);
RETURN avgGPA;
END;
/
Create or replace procedure callGPAFunc as
gpa1 decimal(4,2);
gpa2 decimal(4,2);
gpa3 decimal(4,2);
gpa4 decimal(4,2);
avgGPA decimal(4,2);
BEGIN
select Student_GPA into gpa1 from MyDetails where Student_Term = 1;
select Student_GPA into gpa2 from MyDetails where Student_Term = 2;
select Student_GPA into gpa3 from MyDetails where Student_Term = 3;
select Student_GPA into gpa4 from MyDetails where Student_Term = 4;
avgGPA := findAvgGPA(gpa1, gpa2, gpa3, gpa4);
DBMS_OUTPUT.PUT_LINE('Average GPA is:' ||avgGPA);
END;
/
execute callGPAFunc;

--Question 4
create or replace procedure findMax as
gpa1 decimal(4,2);
gpa2 decimal(4,2);
gpa3 decimal(4,2);
gpa4 decimal(4,2);
BEGIN
select Student_GPA into gpa1 from MyDetails where Student_Term = 1;
select Student_GPA into gpa2 from MyDetails where Student_Term = 2;
select Student_GPA into gpa3 from MyDetails where Student_Term = 3;
select Student_GPA into gpa4 from MyDetails where Student_Term = 4;
IF (gpa1 > gpa2 and gpa1 > gpa3 and gpa1 > gpa4) THEN
  DBMS_OUTPUT.PUT_LINE('Max GPA is:' ||gpa1);
END IF;
IF (gpa2 > gpa1 and gpa2 > gpa3 and gpa2 > gpa4) THEN
  DBMS_OUTPUT.PUT_LINE('Max GPA is:' ||gpa2);
END IF;
IF (gpa3 > gpa1 and gpa3 > gpa2 and gpa3 > gpa4) THEN
  DBMS_OUTPUT.PUT_LINE('Max GPA is:' ||gpa3);
END IF;
IF (gpa4 > gpa1 and gpa4 > gpa2 and gpa4 > gpa3) THEN
  DBMS_OUTPUT.PUT_LINE('Max GPA is:' ||gpa4);
END IF;
END;
/
execute findMax;
SHOW ERRORS
--SELECT * FROM MyDetails;