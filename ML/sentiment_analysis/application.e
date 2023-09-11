note
	description: "Project root class"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			ml_context: ML_CONTEXT
			l_data: SENTIMENT_DATA
		do
			print (data_path)
			io.read_line

				-- Initialize the ML Context
--			create ml_context

		end

	data_path: SYSTEM_STRING
			--  dataset file path.
		local
			l_dir: SYSTEM_STRING
		do
			l_dir := {SYSTEM_DIRECTORY}.get_parent({ENVIRONMENT}.current_directory).full_name
			Result := {SYSTEM_PATH}.combine_string_string_string (l_dir, "Data", "yelp_labelled.txt")
		end
end
