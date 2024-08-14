fx_version 'cerulean'
game 'gta5'

name "dynyx-gym"
description "Gym Workout Script made by Dynyx Scripts"
author "Green"
version "2.0"

lua54 'yes'

shared_scripts {
	-- "@ox_lib/init.lua", -- Uncomment this if you are using OX_LIB
	"config.lua",
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}
