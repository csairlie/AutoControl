on run argv
	
	set pwd to do shell script "security find-generic-password -l SelfControl -w"
	
	if (count of argv) > 0 then
		set duration to item 1 of argv as integer
	else
		set duration to 60 --Default block duration
	end if
	
	tell application "SelfControl" to activate
	
	tell application "System Events"
		tell process "SelfControl"
			tell slider of window "SelfControl"
				set value to duration
			end tell
			click button "Start Block" of window "SelfControl"
		end tell
	end tell
	
	tell application "System Events"
		delay 0.5
		tell process "SecurityAgent"
			set frontmost to true
			set SecurityAgentWindow to get windows
			set value of text field 2 of item 1 of SecurityAgentWindow to pwd
			click button "Install Helper" of window 1
		end tell
	end tell
end run
