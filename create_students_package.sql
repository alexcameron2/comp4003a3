CREATE OR REPLACE PACKAGE Students AS
	-- Add a student by name
	PROCEDURE add_student(name Student.s_name%type);

	-- Add a student by name and birthday
	PROCEDURE add_student(name Student.s_name%type, birthdate Student.s_birth%type);

	-- Add a student by name birthday and address
	PROCEDURE add_student(name Student.s_name%type, birthdate Student.s_birth%type, address Student.s_addr%type);

	-- Delete a Student
	PROCEDURE delete_student(name Student.s_name%type);

	-- Change a Student's Name
	PROCEDURE change_name(id Student.s_ID%type, new_name Student.s_name%type);

	-- Change a Student's address
	PROCEDURE change_address(id Student.s_ID%type, new_address Student.s_addr%type);

	-- Enroll a student in a course
	PROCEDURE enroll_course(student_number Student.s_ID%type, course_number Course.c_ID%type);
END Students;
/
