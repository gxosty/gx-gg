local response = gg.makeRequest("")
local gx = load_string(response.text)()

gx.add_menu({
	title = "Test Main Menu",
	name = "main",
	menu = {
		{"Test1", {gg.open_menu, {"test1_menu"}}},
		{"Test2", {gg.open_menu, {"test2_menu"}}},
	},
	type = "normal"
})

gx.add_menu({
	title = "Test1 Menu",
	name = "test1_menu",
	menu = {
		{"Hello", nil},
		{"World", nil},
	},
	type = "normal"
})

gx.add_menu({
	title = "Test2 Menu",
	name = "test2_menu",
	menu = {
		{"Hello2", nil},
		{"World2", nil},
	},
	type = "back"
})

while true do
	if gg.isVisible(true) then
		gg.setVisible(false)
		gx.start()
	end
	gg.sleep(250)
end