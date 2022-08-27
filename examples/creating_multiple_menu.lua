-- Switching between menus
-- See the example "choice_menu.lua" for more details

-- local response = gg.makeRequest("https://raw.githubusercontent.com/gxosty/gx-gg/main/gx.lua")
-- local gx = load(response.content)()

local gx = require("gx")

-- functions

function mcsalert(text, bool)
	gg.alert(text.." "..tostring(bool), "ok")
end

-- Main menu
gx.add_menu({
	title = "Example of main menu",
	name = "main",
	menu = {
		{"Choice Menu", {gx.open_menu, {"chmenu"}}}, -- use gx.open_menu to open another menu by its name, takes name of menu as an argument
		{"Multi Choice Menu", {gx.open_menu, {"mchmenu"}}},
		{"Multi Choice (Selected) Menu", {gx.open_menu, {"mchsmenu"}}}, 
		{"Back Menu", {gx.open_menu, {"bmenu"}}},
		{"xBack Menu", {gx.open_menu, {"xbmenu"}}}
	},
	type = "choice"
})

-- "choice" type menu, see "choice_menu.lua" example for more info
gx.add_menu({
	title = "Choice menu", -- Menu title
	name = "chmenu", -- Menu name, note that you can write any name that you want. You will open menus by their name.
	menu = {
		{"Test 1", {gg.toast, {"test1"}}},
		{"Test 2", {gg.toast, {"test2"}}},
		{"Test 3", {gg.toast, {"test3"}}}
	},
	type = "choice" -- Obviously "choice" type
})

-- "multi_choice" type, menu, see "multi_choice_menu.lua" example for more info
-- There is also another type "multi_choice_s". They are almost the same thing
-- The only difference is in "multi_choice" you select which funcitons to call. It triggers functions when you select them in menu
-- "multi_choice_s" is more like a switcher (enable/disable), it is better to use with gx language. It triggers functions when you switch them in menu

gx.add_menu({
	title = "Multi Choice menu", -- Menu title
	name = "mchmenu", -- Menu name, note that you can write any name that you want. You will open menus by their name.
	menu = {
		{"Test 1", {gg.alert, {"test1"}}}, -- changing to alert for more understanding
		{"Test 2", {gg.alert, {"test2"}}},
		{"Test 3", {gg.alert, {"test3"}}}
	},
	type = "multi_choice" -- the type itself
})

-- "multi_choice_s" type. You may call it a switcher menu if you want

gx.add_menu({
	title = "Multi Choice (selected) menu", -- Menu title
	name = "mchsmenu", -- Menu name, note that you can write any name that you want. You will open menus by their name.
	menu = {

		-- Time to meet "{gxbool}".
		-- Each button of menu has their of bool value. When you pass "{gxbool}" to function as argument, it will be replaced the bool value of the button.
		-- All button has their own bool value, and it is menu type independent.

		{"Test 1", {mcsalert, {"test1", "{gxbool}"}}}, -- using custom function "mcsalert" (look at the top of the code). It is the same as {"Test 1", {mcsalert, {"test1", true}}} or {"Test 1", {mcsalert, {"test1", false}}}
		{"Test 2", {mcsalert, {"test2", "{gxbool}"}}}, -- the same as {"Test 1", {mcsalert, {"test1", true}}} or {"Test 2", {mcsalert, {"test2", false}}}
		{"Test 3", {mcsalert, {"test3", "{gxbool}"}}} -- the same as {"Test 1", {mcsalert, {"test1", true}}} or {"Test 3", {mcsalert, {"test3", false}}}
	},
	type = "multi_choice_s" -- the type itself
})

-- "back" type menu.
-- Menu with type "back" is useful in some cases. It does the same as "choice" type, but it stays in the same menu when you close script menu, it won't start the main menu.
-- It is like a file explorer, if you want to go to the previous directory, you click back. The same here, to go to the previous menu, you should click "back"
-- Each "back" type menu has "back" button on the bottom of menu.
-- Text of "back" button is customizable

gx.add_menu({
	title = "Back Menu", -- weird title actually
	name = "bmenu",
	menu = {
		{"Test 1", {gg.toast, {"test1"}}},
		{"Test 2", {gg.toast, {"test2"}}},
		{"Test 3", {gg.toast, {"test3"}}}
--		{"back", {gx.go_back}}		-- as if it is written here
	},
	type = "back"
})

-- "xback" type menu. same as "back" type, but it returns to main menu when you close it.

gx.add_menu({
	title = "xBack Menu", -- another weird title
	name = "xbmenu",
	menu = {
		{"Test 1", {gg.toast, {"test1"}}},
		{"Test 2", {gg.toast, {"test2"}}},
		{"Test 3", {gg.toast, {"test3"}}}
--		{"back", {gx.go_back}}		-- as if it is written here
	},
	type = "xback"
})

-- loop
gx.loop(250)