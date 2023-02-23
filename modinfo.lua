-- This information tells other players more about the mod
name = "pruebita"
description = "ojala funcione pls"
author = "un manco"
version = "0.0.1" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = "/"

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true
--client_only_mod = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

-- Character mods are required by all clients
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character",
}

configuration_options = {

	{
		name = "health",		--vida
		label = "Health",
		hover = "",
		options = {
			{description = "Base", data = 75},
			{description = "Easy Mode", data = 50},
			{description = "Very Easy mode", data = 25},
			{description = "Baby Mode", data = 1},
		},
		default = 75
	},
	{
		name = "hunger",		--hambre
		label = "Hunger",
		hover = "",
		options = {
			{description = "Base", data = 300},
			{description = "Easy Mode", data = 250},
			{description = "Very Easy Mode", data = 200},
			{description = "Baby Mode", data = 1},
		},
		default = 300
	},
	{
		name = "sanity",		--cordura
		label = "Sanity",
		hover = "",
		options = {
			{description = "Base", data = 250},
			{description = "Easy Mode", data = 200},
			{description = "Very Easy Mode", data = 150},
			{description = "Baby Mode", data = 1},
		},
		default = 250
	},
	{
		name = "speed",			--Velocidad
		label = "Speed",
		hover = "",
		options = {
			{description = "Base", data = 0},
			{description = "Fast", data = 1},
			{description = "Light´s Speed", data = 2},
		},
		default = 0
	},
}
