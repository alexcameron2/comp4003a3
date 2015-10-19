DECLARE
	command1 varchar2(10000) := 'CREATE TABLE Student (s_ID integer PRIMARY KEY, s_name varchar2(14) NOT NULL, s_birth varchar2(9), s_addr varchar2(10), UNIQUE(s_name))';
	
	command2 varchar2(10000) := 'CREATE TABLE Course(c_ID varchar2(9) PRIMARY KEY, c_name varchar2(6) NOT NULL, c_loc varchar2(7), c_days varchar2(3), c_time varchar2(10), UNIQUE(c_name), CHECK (c_days IN (''MWF'', ''TR'')), CHECK (c_time IN (''8:35-9:25'', ''10:35-11:25'', ''1:35-2:25'', ''3:35-4:25'')))';	

	command3 varchar2(10000) := 'CREATE TABLE Grade (s_ID integer, c_ID varchar2(9), integer mark, PRIMARY KEY (s_ID, c_ID))';

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
