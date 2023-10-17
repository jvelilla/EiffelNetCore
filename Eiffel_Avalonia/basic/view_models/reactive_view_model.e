note
	description: "Summary description for {REACTIVE_VIEW_MODEL}."
	date: "$Date$"
	revision: "$Revision$"

class
	REACTIVE_VIEW_MODEL

inherit

	--REACTIVE_OBJECT
	ANY
		redefine
			default_create
		end

create
	default_create

feature {NONE} -- Initialization

	default_create
		do

		end


feature -- Access

	name: detachable SYSTEM_STRING

	set_name (a_name: like name)
		do
			name := a_name
		end

	greeting: SYSTEM_STRING
		do
			if attached name as s_name then
				Result := "Hello"
				Result := Result.concat(s_name)
			else
				Result := "Hello World from Avalonia.Samples";
			end
		end
end
