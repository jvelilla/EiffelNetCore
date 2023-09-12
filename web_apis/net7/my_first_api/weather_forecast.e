note
	description: "Summary description for {WEATHER_FORECAST}."
	date: "$Date$"
	revision: "$Revision$"

class
	WEATHER_FORECAST


feature -- Access

	date: DATE_ONLY

	temperature_c: INTEGER

	temperature_f: INTEGER
		do
			Result :=  ((temperature_c * 9/ 5) + 32).truncated_to_integer
		end

	summary: detachable SYSTEM_STRING


feature -- Element Change

	set_date (a_date: like date)
		do
			date := a_date
		end

	set_temperature_c (a_temperature_c: like temperature_c)
		require

		do
			temperature_c := a_temperature_c
		end

	set_summary (a_summary: like summary) do
		summary := a_summary
	end


end
