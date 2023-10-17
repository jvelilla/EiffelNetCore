note
	description: "Summary description for {SIMPLE_VIEW_MODEL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

--// This is our simple ViewModel. We need to implement the interface "INotifyPropertyChanged"
--// in order to notify the View if any of our properties changed.

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


feature -- Access

	name: detachable SYSTEM_STRING

	set_name (a_name: like name)
		do
			if name /= a_name then
				name := a_name
					-- update the field
				raise_property_changed ("name")
				raise_property_changed ("greeting")
			end
		end


	greeting: SYSTEM_STRING
		do
			if {SYSTEM_STRING}.is_null_or_empty (name) then
				Result := "Hello World from Avalonia.Samples"
			else
				Result := "Hello"
				Result := Result.concat(name)
			end
		end

feature {NONE} -- Implementation

	raise_property_changed(property_name: detachable SYSTEM_STRING)
			-- Add a method which will raise the above event.
		do
			if attached property_changed as l_property_changed then
				l_property_changed.invoke (Current, create {PROPERTY_CHANGED_EVENT_ARGS}.make (property_name))
			end
		end
end
