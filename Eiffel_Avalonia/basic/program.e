note
	description: "Project root class"

class
	PROGRAM

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_builder: APP_BUILDER_FACADE
			l_app_builder: APP_BUILDER
			l_app: APP
		do
			--l_app_builder := {APP_BUILDER_FACADE}.build_and_configure (({APP}).to_cil )
			l_app_builder := {APP_BUILDER_FACADE}.build_and_configure ({SYSTEM_TYPE}.get_type ("RootCluster.App", True, False))
			--io.read_line
		end
end
