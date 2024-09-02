local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local netspeed_widget = require("modules.widgets.net-speed-widget.net-speed")
local naughty = require("naughty")

-- Keyboard map indicator and switcher
keyboardlayout = awful.widget.keyboardlayout()

-- Clock Widget
textclock = wibox.widget.textclock()

-- poweroff_button
button = awful.widget.button {
	image =  "/home/carlos/.config/awesome/modules/widgets/pmenu.svg",
}
button:connect_signal("button::press", function()
	awful.spawn("/home/carlos/.config/awesome/modules/widgets/pmenu")
end)

--interactive workspace buttons
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

-- Create a promptbox for each screen
    current_screen.promptbox = awful.widget.prompt(current_screen)

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
     current_screen.layoutbox = awful.widget.layoutbox(current_screen)
     current_screen.layoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    
    -- Create a taglist widget
     current_screen.taglist = awful.widget.taglist {
        screen  = current_screen,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    }

    -- Create a tasklist widget
    current_screen.tasklist = awful.widget.tasklist {
        screen  = current_screen,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    current_screen.wibox = awful.wibar({
	position = "top",
	screen = current_screen,
	height = 50,
	bg = gears.color.transparent,
	type = "dock",
    })

    -- Add widgets to the wibox
    current_screen.wibox:setup {	
	layout = wibox.container.margin,
	top = 8,
	left = 44,
	right = 44,
	bottom = 0,
	{
	   layout = wibox.container.background,
	   bg = "#212121",
	   shape = function(cr, w, h) gears.shape.rounded_rect(cr, w,h, 7) end,	
	   {
		layout = wibox.container.margin,
		margins = 5,
		left = 15,
		right = 15,
		{
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
		    layout = wibox.layout.fixed.horizontal,
		    menu_launcher,
		    current_screen.taglist,
		    --current_screen.promptbox,
		},
		wibox.container.place(textclock, 'center', 'center'),
		{ -- Right widgets
		    layout = wibox.layout.fixed.horizontal,
		    netspeed_widget({width=70}),
		    keyboardlayout,
		    wibox.widget.systray(),
		    current_screen.layoutbox,
		    button,
		    spacing = 10
		},
		}
	   }
	}
    }
