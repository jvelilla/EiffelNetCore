note
	description: "Summary description for {MAIN_WINDOW_VIEW_MODEL}."
	date: "$Date$"
	revision: "$Revision$"

class
	MAIN_WINDOW_VIEW_MODEL

inherit

	VIEW_MODEL_BASE

feature -- Models

	simple_view_model: SIMPLE_VIEW_MODEL
		do
			If internal_simple_view_model = Void then
				create internal_simple_view_model
			end
			Result := internal_simple_view_model
		end


	simple_view_model: REACTIVE_VIEW_MODEL
		do
			If internal_reactive_view_model = Void then
				create internal_reactive_view_model
			end
			Result := internal_reactive_view_model
		end

feature {NONE} -- Implementation

	internal_simple_view_model: detachable SIMPLE_VIEW_MODEL

	internal_reactive_view_model: detachable REACTIVE_VIEW_MODEL
end
