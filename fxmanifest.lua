fx_version 'cerulean'
game 'gta5'

shared_scripts {
    '@ox_lib/init.lua',
    'shared.lua',
}

client_scripts {
    'src/client/*.lua'
}

server_scripts {
    'src/server/*.lua'
}

lua54 'yes'

dependencies {
    'ox_lib',
    'ox_inventory',
}