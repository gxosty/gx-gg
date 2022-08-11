local gx = {
	_nav = nil,
	_allow = true,
	_menus = {},
	_back = "back",
	_back_function = nil
}

function gx.split_menu(menu)
	local ml = {}
	local fl = {}

	for k, v in ipairs(menu) do
		table.insert(ml, v[1])

		if v[2] ~= nil then
			fl[#fl + 1] = v[2]
		else
			fl[#fl + 1] = {}
		end
	end

	return {menu = ml, functions = fl}
end

function gx.add_to_nav(t)
	gx._nav[#gx._nav + 1] = t
end

function gx.add_menu(menu)
	if gx._menus ~= 0 then
		if gx._menus["main"] ~= nil then
			if menu.name == "main" then
				gg.toast("Menu with name \"main\" was declared twice, exiting...")
				os.exit()
			end
		elseif menu.name == "main" and menu.type == "back" then
			gg.toast("Menu with name \"main\" cannot be\"back\" type, exiting...")
			os.exit()
		end
	end

	if menu.name == "main" then
		gx._nav = {}
		gx._nav[1] = {name = menu.name, allow_stay = true}
	end

	local list = gx.split_menu(menu.menu)
	menu.menu = list.menu
	menu.functions = list.functions

	if menu.type == "back" then
		table.insert(menu.menu, gx._back)
		menu.functions[#menu.functions + 1] = {gx._back_function}
	end

	gx._menus[menu.name] = menu
end

function gx.go_back()
	table.remove(gx._nav)
	gx.continue()
end

gx._back_function = gx.go_back

function gx.open_menu(menu_name)
	local the_menu = gx._menus[menu_name]
	if the_menu == nil then
		gg.toast("Menu \""..menu_name.."\" doesn't exist.")
		return
	end
	local allow_stay = false

	if the_menu.type == "back" then
		allow_stay = true
	else
		allow_stay = false
	end
	if gx._nav[#gx._nav].name ~= menu_name then
		gx.add_to_nav({name = the_menu.name, allow_stay = allow_stay})
	end
	local ch = gg.choice(the_menu.menu, nil, the_menu.title)

	if ch == nil then return end
	if #the_menu.functions[ch] > 0 then
		if #the_menu.functions[ch] == 1 then
			the_menu.functions[ch][1]()
		else
			the_menu.functions[ch][1](table.unpack(the_menu.functions[ch][2]))
		end
	end
end

function gx.nav_update()
	while #gx._nav > 1 do
		if gx._nav[#gx._nav].allow_stay == false then
			table.remove(gx._nav)
		else
			break
		end
	end
end

function gx.continue()
	gx.open_menu(gx._nav[#gx._nav].name)
end

function gx.start()
	if gx._nav == nil then
		gg.toast("No menu was found, exiting...")
		os.exit()
	elseif gx._nav[1].name ~= "main" then
		gg.toast("No Main menu was found, exiting...")
		os.exit()
	end

	gx.nav_update()
	gx.continue()
end

return gx