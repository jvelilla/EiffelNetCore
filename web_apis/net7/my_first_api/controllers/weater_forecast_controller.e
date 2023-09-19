note
	description: "Summary description for {WHEATER_FORECAST_CONTROLLER}."
	date: "$Date$"
	revision: "$Revision$"
	metadata: create {API_CONTROLLER_ATTRIBUTE}.make end,
			  create {ROUTE_MVC_ATTRIBUTE}.make("[controller]") end


class
	WEATER_FORECAST_CONTROLLER

inherit

	CONTROLLER_BASE

feature -- Access

	summaries: ARRAY[SYSTEM_STRING]
		do
			Result := <<"Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching">>
		end


	get: IENUMERABLE
		note
			property: auto
			property_metadata: create {HTTP_GET_ATTRIBUTE}.make end

		local
			l_forecast: WEATHER_FORECAST
			i: INTEGER
			l_result:ARRAY_LIST
		do
			create l_result.make_from_capacity(5)
			from
				i := 1
			until
				i > 5
			loop
				create l_forecast
				l_forecast.set_date ({DATE_ONLY}.from_date_time ({SYSTEM_DATE_TIME}.now.add_days (i)))
				l_forecast.set_temperature_c ({SYSTEM_RANDOM}.shared.next_integer_32_integer_32(-20, 55))
				l_forecast.set_summary (summaries[{SYSTEM_RANDOM}.shared.next_integer_32(summaries.count) + 1])
				l_result.add (l_forecast).do_nothing
			end
			Result := l_result
		end

end
