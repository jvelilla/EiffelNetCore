note
	description: "Summary description for {SIMPLE_VIEW_MODEL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIMPLE_VIEW_MODEL

inherit

	INOTIFY_PROPERTY_CHANGED

feature -- Event

	property_changed: detachable PROPERTY_CHANGED_EVENT_HANDLER
		-- This event is implemented by "INotifyPropertyChanged" and is all we need to inform
        -- our View about changes.


	add_property_changed (value: PROPERTY_CHANGED_EVENT_HANDLER)
			-- Occurs when a property value changes.
		do
			property_changed := value
		end

	remove_property_changed (value: PROPERTY_CHANGED_EVENT_HANDLER)
			-- Occurs when a property value changes.
		do
			property_changed := Void
		end

end
