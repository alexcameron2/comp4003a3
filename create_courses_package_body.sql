CREATE OR REPLACE PACKAGE BODY Courses AS

	--Procedure to add a course by ID and name. Ensures the course ID and Name are unique
	PROCEDURE add_course(id Course.c_ID%type, name Course.c_name%type) IS
		id_exists_exeption EXCEPTION;
		name_exists_exception EXCEPTION;
		BEGIN
			IF EXISTS (SELECT * FROM Course WHERE c_ID = id) THEN
				RAISE id_exists_exception;
			ELSIF EXISTS (SELECT * FROM Course WHERE c_name = name) THEN
				RAISE name_exists_exception;
			END IF;
		
			INSERT INTO Course (c_ID, c_name, c_loc, c_days, c_time) VALUES (id, name, NULL, NULL, NULL);
		EXCEPTION
			WHEN id_exists_exception THEN
				dbms_output.put_line('Course ID already in use');
			WHEN name_exists_exception THEN
				dbms_output.put_line('Course name already exists');
				
	END add_course;
	
	--Procedure to add a full course. Ensures the course ID, name, and combination of date + time are all unique
	PROCEDURE add_course(id Course.c_ID%type, name Course.c_name%type, loc Course.c_loc%type, days Course.c_days%type, times Course.c_time%type) IS
		id_exists_exeption EXCEPTION;
		name_exists_exception EXCEPTION;
		BEGIN
			IF EXISTS (SELECT * FROM Course WHERE c_ID = id) THEN
				RAISE id_exists_exception;
			ELSIF EXISTS (SELECT * FROM Course WHERE c_name = name) THEN
				RAISE name_exists_exception;
			END IF;
		
			INSERT INTO Course (c_ID, c_name, c_loc, c_days, c_time) VALUES (id, name, loc, days, times);
		EXCEPTION
			WHEN id_exists_exception THEN
				dbms_output.put_line('Course ID already in use');
			WHEN name_exists_exception THEN
				dbms_output.put_line('Course name already exists');
	END add_course;

	--Procedure to delete a course
	PROCEDURE delete_course(name Course.c_name%type) IS
		id_not_exists EXCEPTION
		BEGIN
			IF NOT EXISTS (SELECT * FROM Course WHERE c_name = name) THEN
				RAISE id_not_exists;
			END IF;
			
			DELETE FROM Course WHERE c_name = name;
		EXCEPTION
			WHEN id_not_exists THEN
				dbms_output.put_line('Course name does not currently exist');
	END delete_course;
	
	--Procdecure to change the location of a course
	PROCEDURE change_loc(id Course.c_ID%type, new_loc Course.c_loc%type) IS
		BEGIN
			UPDATE Course SET c_loc = new_loc WHERE c_ID = id;
	END change_loc;
	
	--Procedure to update the mark for a student enrolled in a course
	PROCEDURE give_mark(sID Student.s_ID%type, cID Course.c_ID%type, percent Grade.mark%type) IS
		--Students enroll in a course and automatically get a mark of zero. This updates that mark
		BEGIN
			UPDATE Grade SET mark = percent WHERE sID = student AND cID = course;
	END give_mark;

END Courses;
/