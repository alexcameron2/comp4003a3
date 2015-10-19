/*
*Program witrren by Alex Cameron 100861937 for COMP4003
* RUN: Log into SQL*PLUS and type: run part1.sql
*
*Part 1(10)
Use Oracle VM to create the following three tables that satisfy all the constraints listed:: 
student
	with attributes s# ()primary key), name, birthdate, and address; 
course
	with attributes c# (primary key), name, and location, days, and times. 
grade
	with attribute s# (primary key and foreign key), c# (primary key and foreign key) , and mark. 

1.Days of a course must be one of "MWF" or "TR". 
2.Times of a course must be one of "8:35-9:25", "10:35-11:25", "1:35-2:25", "3:35-4:25". 
3.Student names and course names are unique and cannot be null
*/

DECLARE
	--drop1 varchar2(100) := 'DROP TABLE IF EXISTS Stduent';
	--drop2 varchar2(100) := 'DROP TABLE IF EXISTS Course';
	--drop3 varchar2(100) := 'DROP TABLE IF EXISTS Grade';

	command1 varchar2(200) := 'CREATE TABLE Student (s_ID integer PRIMARY KEY, s_name varchar2(14) NOT NULL, s_birth varchar2(9), s_addr varchar2(10), UNIQUE(s_name))';
	
	command2 varchar2(200) := 'CREATE TABLE Course(c_ID varchar2(9) PRIMARY KEY, c_name varchar2(6) NOT NULL, c_loc varchar2(7), c_days varchar2(3), c_time varchar2(10), UNIQUE(c_name), CHECK (c_days IN (''MWF'', ''TR'')), CHECK (c_time IN (''8:35-9:25'', ''10:35-11:25'', ''1:35-2:25'', ''3:35-4:25'')))';	

	command3 varchar2(200) := 'CREATE TABLE Grade (student integer, course varchar2(9), integer mark, PRIMARY KEY (student, course), FOREIGN KEY (student) REFERENCES Student(s_ID), FOREIGN KEY (course) REFERENCES Course(c_ID))';

BEGIN
	--execute immediate drop1;
	--execute immediate drop2;
	--execute immediate drop3;


	execute immediate command1;
	dbms_output.put_line('Student table created');
	execute immediate command2;
	dbms_output.put_line('Course table created');
	execute immediate command3;
	dbms_output.put_line('Grade table created');

END;
/
