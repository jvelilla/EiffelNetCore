note
	description: "Summary description for {WHEATER_FORECAST_CONTROLLER}."
	date: "$Date$"
	revision: "$Revision$"
	api_controller: create {API_CONTROLLER_ATTRIBUTE}.make end
	route: create {ROUTE_MVC_ATTRIBUTE}.make("controller") end

class
	WEATER_FORECAST_CONTROLLER

inherit

	CONTROLLER


feature -- Access

	summaries: ARRAY[SYSTEM_STRING]
		do
			Result := <<"Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching">>
		end


	get: IENUMERABLE
		note
			http_get: get_attribute 
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

	get_attribute:	HTTP_GET_ATTRIBUTE
		do
			create Result.make
			Result.set_name("GetWeatherForecast")
		end


end
