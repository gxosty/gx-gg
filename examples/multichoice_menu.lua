-- See the first example "choice_menu.lua" for more details

-- local response = gg.makeRequest("https://raw.githubusercontent.com/gxosty/gx-gg/main/gx.lua")
-- local gx = load(response.content)()

local gx = require("gx")

gx.add_menu({
	title = "Choice menu example",	-- Menu title
	name = "main", -- Menu name
	menu = {
		{"Test 1", {gg.alert, {"Test 1", "ok"}}},
		{"Test 2", {gg.alert, {"Test 2", "ok"}}},
		{"Test 3", {gg.alert, {"Test 3", "ok"}}},
		{"Test 4", {gg.alert, {"Test 4", "ok"}}},
		{"Test 5", {gg.alert, {"Test 5", "ok"}}},
	},
	type = "multi_choice" -- Type of the menu
})

-- multi_choice will call functions of those that have been checked/chosen

gx.loop(250)