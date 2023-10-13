partial class MAIN_WINDOW
	inherit WINDOW
		redefine
			default_create
		end
create
	default_create

feature {NONE} -- Initialization

		default_create
			do
   	         	initialize_component (True,True)
 			end


 		initialize_component (load_xml: BOOLEAN;  attach_dev_tools: BOOLEAN)
 			do
 				if load_xml then
 					{AVALONIA_XAML_LOADER}.load(Current)
 				end
 			end
end
