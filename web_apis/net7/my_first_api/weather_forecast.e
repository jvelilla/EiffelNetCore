note
	description: "Summary description for {WEATHER_FORECAST}."
	date: "$Date$"
	revision: "$Revision$"

class
	WEATHER_FORECAST


feature -- Access

	date: DATE_ONLY
--		note property:auto
--		 	 property_metadata: create {JSON_PROPERTY}.make_from_message ("date") end
		attribute end

	temperature_c: INTEGER
--		note property:auto
--		 	 property_metadata: create {JSON_PROPERTY}.make_from_message ("temperature_c") end
--		attribute end

	temperature_f: INTEGER
--		note property:auto
--		 	 property_metadata: create {JSON_PROPERTY}.make_from_message ("temperature_f") end
		do
			Result :=  ((temperature_c * 9/ 5) + 32).truncated_to_integer
		end

	summary: detachable SYSTEM_STRING
--		note property:auto
--		 	 property_metadata: create {JSON_PROPERTY}.make_from_message("summary") end
		attribute end


feature -- Element Change

	set_date (a_date: like date)
			-- Set `date' with `a_date'
		do
			date := a_date
		ensure
			date_set: date = a_date
		end

	set_temperature_c (a_temperature_c: like temperature_c)
			-- Set `temperature' with `a_temperature_c'
		do
			temperature_c := a_temperature_c
		ensure
			temperature_set: temperature_c = a_temperature_c
		end

	set_summary (a_summary: like summary)
			-- Set `summary' with `a_summary'
		do
			summary := a_summary
		ensure
			summary_set: summary = a_summary
		end


end
