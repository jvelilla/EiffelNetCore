note
	description: "Summary description for {REPOSITORY}."
	date: "$Date$"
	revision: "$Revision$"

-- Name
--
-- Using Newtonsof.JSON third party library.
-- Issues with the generation of the config file
-- deps.json, third party libraries are not included.

class
	REPOSITORY

inherit

	SYSTEM_OBJECT

feature -- Access

	name: SYSTEM_STRING

	description: SYSTEM_STRING

	git_hub_homeUrl: URI

	home_page: URI

	watchers: INTEGER

  	last_push_utc: SYSTEM_DATE_TIME


	last_push: SYSTEM_DATE_TIME
		do
			Result := last_push_utc.to_local_time
		end

feature -- Element Change

	set_name (a_name: SYSTEM_STRING)
		do
			name := a_name
		end

feature -- Convertion

	to_json: SYSTEM_STRING
		do
			Result := {SYSTEM_STRING}.empty
			Result := {JSON_CONVERT}.serialize_object_object_type(Current, Result.generating_type.to_cil, Void)
		end


	from_json (a_json: SYSTEM_STRING): REPOSITORY
		local
			conv: JSON_CONVERT
		do
			create Result
			{SYSTEM_CONSOLE}.write_line(Result.generator.to_cil)
			if attached {REPOSITORY} {JSON_CONVERT}.deserialize_object_string_type(a_json, Result.generating_type.to_cil) as l_repo then
			   	Result := l_repo
			end
		ensure
			is_class: class
		end

end
