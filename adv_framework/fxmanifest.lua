fx_version 'adamant'

game 'gta5'

ui_page('web/index.html')

files {
	'web/index.html',
    'web/pricedown.ttf',
    'web/scripts.js',
    'web/style.css',
    'web/icon/1.png',
    'web/icon/2.png',
}

shared_scripts {
    "shared.lua"
}

client_scripts {
    "client/handler.lua",
    "client/utils.lua",
    "client/modules/event/*.lua",
    "client/modules/spawned/*.lua",
    "client/modules/status/*.lua",
}

server_scripts {
    "dev/commands.lua",
    "server/server.lua",
    "server/items.lua",
    "server/event/event.lua",
    "server/playerManager/*.lua",
    "server/jobManager/*.lua",
}

--exports.oxmysql:execute('SELECT user_id FROM store_business WHERE market_id = ?', {key}, function(result)