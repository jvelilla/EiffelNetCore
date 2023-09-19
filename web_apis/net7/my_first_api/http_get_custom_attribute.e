note
	description: "Summary description for {HTTP_GET_CUSTOM_ATTR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTTP_GET_CUSTOM_ATTRIBUTE

inherIt

	HTTP_GET_ATTRIBUTE

create
	make_with_name


feature {NONE} -- Initialization

	make_with_name (a_value: SYSTEM_STRING)
		do
			make
			set_name (a_value)
		end
end
