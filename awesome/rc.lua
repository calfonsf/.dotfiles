-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
local naughty = require("naughty")

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
	title = "Oops, there were errors during startup!",
	text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

---------------------------------------------
--  calfonsf CUSTOMS
---------------------------------------------

require("awful.autofocus")

require("modules.vars") -- Global Variable definitions
require("modules.menu") -- Menu
require("modules.layouts") -- Enable Layouts
require("modules.setup_screen") -- Setup every screen
require("modules.keybindings") -- Keybindings Remap
require("modules.autostart") -- Startup apps
require("modules.rules") -- rules for windows and apps


