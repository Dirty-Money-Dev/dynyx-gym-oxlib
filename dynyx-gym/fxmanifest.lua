fx_version 'cerulean'
game 'gta5'

name "dynyx-gym"
description "Gym Workout Script made for DynyxRP"
author "Green"
version "1.0."

lua54 'yes'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'client/*.lua',
    'config.lua',
}

server_scripts {
	'server/*.lua',
}

shared_script '@ox_lib/init.lua'

dependencies {
	'qb-target',
	'mz-skills'
}
