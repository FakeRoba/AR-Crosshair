game 'gta5'
fx_version 'cerulean'
lua54 'yes'
version '1.1.0'
repository 'https://github.com/FakeRoba/AR-Crosshair'
author 'Roba'

files {
    'Locales/*.json'
}

client_scripts {
    'Config/Config.lua',
    'Client/*.lua'
}

server_script 'Server/Version.lua'
shared_script '@ox_lib/init.lua'
