note
	description: "Project root class"

class
	APPLICATION

inherit
	SYSTEM_OBJECT
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_controler: WEATER_FORECAST_CONTROLLER
			builder: WEB_APPLICATION_BUILDER
			l_native: NATIVE_ARRAY [SYSTEM_STRING]
			--l_service: SWAGGER_GEN_SERVICE_COLLECTION_EXTENSIONS
			l_mvc_builder: IMVC_BUILDER
			l_service_collection: ISERVICE_COLLECTION
			l_app: WEB_APPLICATION
		do
			builder := {WEB_APPLICATION}.create_builder()

				-- Add services to the container
			if attached {SERVICE_COLLECTION} builder.services as l_services then
				{MVC_SERVICE_COLLECTION_EXTENSIONS}.add_controllers (l_services).do_nothing
					-- Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
				{ENDPOINT_METADATA_API_EXPLORER_SERVICE_COLLECTION_EXTENSIONS}.add_endpoints_api_explorer (l_services).do_nothing
				--{SWAGGER_GEN_SERVICE_COLLECTION_EXTENSIONS}.add_swagger_gen(l_services).do_nothing
					-- Adding swagger raise
			end

			l_app := builder.build

				-- Configure the HTTP request pipeline.
			if attached {HOSTING_ENVIRONMENT} l_app.environment as l_environment and then {HOST_ENVIRONMENT_ENV_EXTENSIONS}.is_development(l_environment) then
				print ("Configure Request Pipeline")
			end

			{HTTPS_POLICY_BUILDER_EXTENSIONS}.use_https_redirection (l_app).do_nothing()

			{AUTHORIZATION_APP_BUILDER_EXTENSIONS}.use_authorization (l_app).do_nothing()

			{CONTROLLER_ENDPOINT_ROUTE_BUILDER_EXTENSIONS}.map_controllers (l_app).do_nothing()

			l_app.run (Void)
		end



end
