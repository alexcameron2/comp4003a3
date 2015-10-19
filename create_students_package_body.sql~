CREATE OR REPLACE PACKAGE BODY Students AS
	
	PROCEDURE add_student(name Student.s_name%type) IS
		id Student.s_ID%type;
		myException EXCEPTION
		BEGIN
			IF EXISTS (SELECT * FROM Student WHERE s_name = name) THEN
				RAISE myException;
			END IF;	
				
			SELECT MAX(s_ID) INTO id FROM Students;
			id := id + 1;
			INSERT INTO Student (s_ID, s_name, s_birth, s_addr) VALUES (id, name, NULL, NULL);
		
		EXCEPTION
			WHEN myException THEN
				dbms_output.put_line('Student already exists!');
			WHEN OTHERS THEN
				dbms_output.put_line('An unexpected error has occured');
		
	END add_student;
	
	PROCEDURE add_student(name Student.s_name%type, birthdate Student.s_birth%type) IS
		id Student.s_ID%type;
		myException EXCEPTION
		BEGIN
			IF EXISTS (SELECT * FROM Student WHERE s_name = name) THEN
				RAISE myException;
			END IF;
			
			SELECT MAX(s_ID) INTO id FROM Students;
			id := id + 1;
			INSERT INTO Student (s_ID, s_name, s_birth, s_addr) VALUES (id, name, birthdate, NULL);
		EXCEPTION
			WHEN myException THEN
				dbms_output.put_line('Student already exists!');
			WHEN OTHERS THEN
				dbms_output.put_line('An unexpected error has occured');
				
	END add_student;
	
	PROCEDURE add_student(name Student.s_name%type, birthdate Student.s_birth%type, address Student.s_addr%type) IS
		id Student.s_ID%type;
		myException EXCEPTION
		BEGIN
			IF EXISTS (SELECT * FROM Student WHERE s_name = name) THEN
				RAISE myException;
			END IF;
		
			SELECT MAX(s_ID) INTO id FROM Students;
			id := id + 1;
			INSERT INTO Student (s_ID, s_name, s_birth, s_addr) VALUES (id, name, birthdate, address);
		
		EXCEPTION
			WHEN myException THEN
				dbms_output.put_line('Student already exists!');
			WHEN OTHERS THEN
				dbms_output.put_line('An unexpected error has occured');
			
	END add_student;
	
	PROCEDURE delete_student(name Student.s_name%type) IS
		myException EXCEPTION
		BEGIN
			IF NOT EXISTS (SELECT * FROM Student WHERE name = s_name) THEN
				RAISE myException;
			END IF;
		
			DELETE FROM Student WHERE s_name = name;
		EXCEPTION
			WHEN myException THEN
				dbms_output.put_line('Student does not exist!');
				
	END delete_student;

	PROCEDURE change_name(id Student.s_ID%type, new_name Student.s_name%type) IS
		BEGIN
			UPDATE Student SET s_name = new_name WHERE s_ID = id;
	END change_name;
	
	PROCEDURE change_address(id Student.s_ID%type, new_address Student.s_addr%type) IS
		BEGIN
			UPDATE Student SET s_addr = new_address WHERE s_ID = id;
	END change_name;
	
	PROCEDURE enroll_course(sID Student.s_ID%type, cID Course.c_ID%type) IS
		BEGIN
			INSERT INTO Grade (student, course, mark) VALUES (sID, cID, 0);
	END enroll_course;
		
	
END Students;
/