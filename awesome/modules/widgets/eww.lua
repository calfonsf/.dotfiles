---------------------------------------------------
-- Integration with EWW Widgets For Awesome WM 
-- author: CAF
---------------------------------------------------
local awful = require("awful")

local HOME_DIR = os.getenv("HOME")
local EWW_CONFIG_PATH = HOME_DIR .. '/.config/eww/'

awful.spawn("eww open example")

-- Sending Eww the current workspace
current_screen:connect_signal("tag::history::update", function() 
	local selected_tag = awful.tag.selected(1).name
	awful.spawn(string.format("eww update active_workspace=%s", selected_tag), false) 
end)
