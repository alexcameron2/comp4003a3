CREATE OR REPLACE PACKAGE Courses AS
	-- Add a course by number and name
		PROCEDURE add_course(id Course.c_ID%type, name Course.c_name%type);
	-- Add a course by number, name, location and days
		PROCEDURE add_course(id Course.c_ID%type, name Course.c_name%type, location Course.c_loc%type, days Course.c_days%type, times Course.c_time%type);
	-- Delete a course
		PROCEDURE delete_course(name Course.c_name%type);
	-- Change the location of a course
		PROCEDURE change_loc(id Course.c_ID%type, new_loc Course.c_loc%type);
	-- give_mark
		PROCEDURE give_mark(sID Student.s_ID%type, cID Course.c_ID%type, percent Grade.mark%type);		
END Courses;
/