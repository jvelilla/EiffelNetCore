note
	description: "Project root class"

class
	APPLICATION

inherit
    ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			builder: WEB_APPLICATION_BUILDER
		do
			print ("Eiffel .Net7 template project")
		end
end
