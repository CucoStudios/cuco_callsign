fx_version "cerulean"

game "gta5"

lua54 "yes"

shared_scripts {
    "@es_extended/imports.lua",
    "@ox_lib/init.lua",
    "shared/*.lua"
}

server_scripts {
    "server/*.lua",
}

client_scripts {
    "client/*.lua",
}

dependencies {"es_extended", "ox_lib", "/server:6683", "/gameBuild:2944"}