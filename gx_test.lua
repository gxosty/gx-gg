local gx = nil

-- if gg.alert("Net?", "yes", "no") == 1 then
if true then
	local response = gg.makeRequest("https://raw.githubusercontent.com/gxosty/gx-gg/main/gx.lua")
	gx = load(response.content)()
else
	gx = require("gx")
end

function get_map()
	return "Eden"
end

function no_wind(index)
	gg.toast(tostring(index))
end

propsid = {
	{57978849,       "Windmill🏅"},
	{-677716449,     "Purple Umbrella ☂️"},
	{-644161211,     "Transparent Umbrella ☂️"},
	{992885953,      "Table 🪑"},
	{-1444947170,    "XMas table 🪑"},
	{3580839943,     "Swing ❤"},
	{3779226149,     "Campfire 🔥"},
	{-1030495085,    "Seesaw 🔨"},
	{3634028466,     "Flower Umbrella🌂"},
	{2574095143,     "Umbrella ☔"},
	{3269660804,     "Guitar 🎻"},
	{2352004821,     "Ukulele 🎸"},
	{-1382855507,    "Pipa 🎸"},
	{396560731,      "Flute 🎶"},
	{1237767078,     "Pan flute 🎺"},
	{1889256860,     "Piano 🎹"},
	{3275797515,     "White Piano 🎼"},
	{3280753494,     "Firework 🎆"},
	{4246711693,     "Shaker 🔔"},
	{4196378836,     "Daser"},
	{900914909,      "Steel Drum 🥁"},
	{3499881140,     "Big Quilt Drum 🥁"},
	{2003040587,     "Small Double Drum 🥁"},
	{2671000446,     "Harp"},
	{399957901,      "Xiloph"},
	{1064146256,     "Circle Harp"},
	{1021011859,     "Horn 📯"},
	{2186944737,     "Ancestor Jar "},
	{2041015009,     "Ancestral Kettle"},
	{776794517,      "Ancestral Spear 🔱"},
	{-896102798,     "Cornet 🎷"},
	{1079120316,     "Bookcase 📚"},
	{1994487329,     "Hammock 🛌"},
	{-1762117817,    "Torch 🔥"},
	{-1513173800,    "Tent ⛺"},
	{-2094712299,    "lantern? 🏮"},
	{1661108877,     "Hoop 🏀"},
	{3314486409,     "Tea table 🍵"},
	{351343999,      'Rose 🌹'},
	{638976622,      'Star lamp ⭐'},
	{-1723880395,    'Fox 🦊'},
	{-777390487,     'Electro guitar 🎸'},
	{-994414187,     'Birthday flag 🎉'},
	{1638144370,     'Ocarina 🎵'},
	{-2058340788,    'Yellow Umbrella ☂️'},
	{1480625729,     'Double Chair 🪑🪑'},
	{-1352265746,    'Wooden Double chair 🪑🪑'},
	{1192794220,     'Pipe'},
	{9427151,        'Beach ball 🏐'},
	{-1192675672,    'Beach bed 🛏️'},
	{1793801900,     'Stone fire 🔥'},
	{313507026,      'Mini stone fire 🔥'},
	{90660037,       "Aviary Flag 🏳️‍"},
	{3772092866,     "Nightbook 🔹"},
	{3454884039,     "Light Ball 🏐"},
	{946432484,      "Island Umbrella ⛱️"}, 
	{660764419,      "Brazier 3 🔥"},
	{2546683657,     "Pumpkin 🎃"},
	{2657110838,     "Kalimba 🎹"},
	{1279207725,     "Mischief Table 🎃🪑"},
	{-481291981,     "Spell Water 🌊"},
	{1713655968,     "Spell Earth ⛰️"},
	{-283779536,     "Spell Wind 💨"},
	{2026179880,     "Spell Fire 🔥"},
	{1931354705,     "Snow Globe 🔮"},
	{-699266735,     "Pillow Xmas"},
	{2035109393,     "Nothing"},
	{0,              "Disable ❌"}
}

function prop_menu()
	local _menu = {}

	for k, v in ipairs(propsid) do
		table.insert(_menu, "{gxindex}. "..v[2])
	end

	return _menu
end

function ftest(index)
	gg.toast(tostring(index[1]))
end

function test2(index, bools)
	local s = ""
	for k, v in ipairs(index) do
		s = s.."\n"..tostring(v).." = "..tostring(bools[v])
	end
	gg.toast(s)
end

gx.add_menu({
	title = "Choose the hack:",
	name = "main",
	menu = {
		{"[⬆️] Wall Breach: {gx:settings.wb}", nil},
		{"[⏭] Farm", {gx.open_menu, {"farm"}}},
		{"[🌀] Teleporter", {gx.open_menu, {"teleporter"}}},
		{"[🪑] Prop Hack", {gx.open_menu, {"propmenu"}}},
		{"[💻] Open (UI)", nil},
		{"[💫] Spells", nil},
		{"[🎉] Fun!", nil},
		{"[🦋] Wings", nil},
		{"[💨] No Wind Wall", {gg.toast, {"No Wind", true}}},
		{"[✨] Other Hacks", {gx.open_menu, {"hackmenu"}}},
		{"[⚙️] Settings", nil}
	},
	type = "choice"
})

gx.add_menu({
	title = {"Current map: ", {get_map}},
	name = "farm",
	menu = {
		{"{gxsign} [▶️] Semi-AutoCR", nil},
		{"{gxsign} [▶️] Semi-WingLight Run", nil},
		{"{gxsign} [📍] Teleport WLs to yourself", nil},
		{"{gxsign} [📍] Teleport Statues to yourself⚠️", nil},
		{"{gxsign} [☀️] Collect Waxes", nil},
		{"{gxsign} [⭐] Collect WLs", nil},
		{"{gxsign} [🔓] Unlock Elders", nil}
	},
	type = "back"
})

gx.add_menu({
	title = {"Current map: ", {get_map}},
	name = "teleporter",
	menu = {
		{"[⏩] Change Map", nil},
		{"[🚩] Go to", nil}
	},
	type = "back"
})

gx.add_menu({
	title = "Choose prop:",
	name = "propmenu",
	menu = {prop_menu},
	f = {ftest, {"{gxindex}"}},
	type = "choice"
})

gx.add_menu({
	title = "Select hack:",
	name = "hackmenu",
	menu = {
		"{gxsign} Autoburn 🔥",
		"{gxsign} Unlock All Cosmetics & Emotes 🔓",
		"{gxsign} Unlock Friendship Nodes 🔓",
		"{gxsign} Read Chats",
		"{gxsign} Unlimited Energy ♾️",
		"{gxsign} Quick Steps ⚡",
		"{gxsign} Remove Clouds ☁️",
		"{gxsign} No Knockdown 🚹",
		"{gxsign} God Mode"
	},
	use_single_function = true,
	f = {test2, {"{gxindex}", "{gxbool}"}},
	type = "multi_choice"
})

-- on  = '¦✅¦'
-- off = '¦❌¦'

gx.vars["settings"] = {
	wb = 5.0
}
gx.set_back_text("[⬅️] Back")
gx.set_signs({[false] = "¦❌¦", [true] = "¦✅¦"})

while true do
	if gg.isVisible(true) then
		gg.setVisible(false)
		gx.start()
	end
	gg.sleep(250)
end
