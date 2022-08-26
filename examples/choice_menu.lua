local response = gg.makeRequest("https://raw.githubusercontent.com/gxosty/gx-gg/main/gx.lua")	-- getting "gx" code
local gx = load(response.content)()																-- executing the code and declaring gx

-- a function

function sum(a, b)
	gg.toast(tostring(a + b))
end

-- Example of creating choice menu
-- The main menu should have "main" name. This is the menu that will be run first
gx.add_menu({
	title = "Choice Menu Example",					-- Title of menu
	name = "main",									-- the menu with name "main" is the first menu that will show up when calling gx.loop function
	menu = {
		{"Test button"},							-- Functionless button
		{"Toast \"Hello\"", {gg.toast, {"Hello"}}},	-- Calling a function with an argument
		{"Sum 2 + 5", {sum, {2, 5}}},				-- Calling a function with multiple arguments
		{"Exit", {os.exit}}							-- Calling a function without arguments
	},
	type = "choice"									-- This is where the type of menu is declared. A menu with name "main" shouldn't have type "back" or "xback"
})

--[[

Above menu is the same as:

function mainmenu()
	choice = gg.choice({
		"Test button",
		"Toast \"Hello\"",
		"Sum 2 + 5",
		"Exit"
	}, nil, "Choice menu Example")
	
	if choice == nil then
		return
	end

	if choice == 2 then
		gg.toast("Hello")
	elseif choice == 3 then
		sum(2, 5)
	elseif choice == 4 then
		os.exit()
	end
end

... Some operation

while true do
	
	...

	mainmenu()

	...

end
]]--

gx.loop(250) -- looping with 250ms interval (0.25 seconds)