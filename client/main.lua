local function contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

RegisterNetEvent("mn_callsign:client:setCallsign", function()
    local jobName = ESX.PlayerData.job.name
    if contains(Config.callsignJobs, jobName) then
        local input = lib.inputDialog("Definir Equipa:", {
            {
                type = "multi-select",
                label = "Selecionar Equipa/s",
                options = {
                    {value = "Nenhuma", label = "Nenhuma"},
                    {value = "A", label = "Alfa"},
                    {value = "B", label = "Bravo"},
                    {value = "C", label = "Charlie"},
                    {value = "D", label = "Delta"},
                    {value = "E", label = "Echo"},
                    {value = "F", label = "Foxtrot"},
                    {value = "G", label = "Golf"},
                    {value = "H", label = "Hotel"},
                    {value = "I", label = "India"},
                    {value = "J", label = "Juliett"},
                    {value = "K", label = "Kilo"},
                    {value = "L", label = "Lima"},
                    {value = "M", label = "Mike"},
                    {value = "N", label = "November"},
                    {value = "O", label = "Oscar"},
                    {value = "P", label = "Papa"},
                    {value = "Q", label = "Quebec"},
                    {value = "R", label = "Romeu"},
                    {value = "S", label = "Sierra"},
                    {value = "T", label = "Tango"},
                    {value = "U", label = "Uniform"},
                    {value = "V", label = "Victor"},
                    {value = "W", label = "Whiskey"},
                    {value = "X", label = "X-Ray"},
                    {value = "Y", label = "Yankee"},
                    {value = "Z", label = "Zulu"},
                },
                required = true
            },
        })
        if input then
            local callsignType = ""
            if input[1] == "Nenhuma" then
                local currentCallsign = ESX.PlayerData.Metadata.callsign
                if currentCallsign then
                    callsignType = currentCallsign:match("(%d+)")
                end
            else
                local selectedLetters = {}
                for _, v in ipairs(input[1]) do
                    table.insert(selectedLetters, v)
                end
                callsignType = table.concat(selectedLetters, "")
            end
            TriggerServerEvent("mn_callsign:server:setCallsign", callsignType)
        end
    end
end)

RegisterCommand("callsign", function(source, args, RawCommand)
    local jobName = ESX.PlayerData.job.name
    if contains(Config.callsignJobs, jobName) then
        local input = lib.inputDialog("Definir Equipa:", {
            {
                type = "multi-select",
                label = "Selecionar Equipa/s",
                options = {
                    {value = "Nenhuma", label = "Nenhuma"},
                    {value = "A", label = "Alfa"},
                    {value = "B", label = "Bravo"},
                    {value = "C", label = "Charlie"},
                    {value = "D", label = "Delta"},
                    {value = "E", label = "Echo"},
                    {value = "F", label = "Foxtrot"},
                    {value = "G", label = "Golf"},
                    {value = "H", label = "Hotel"},
                    {value = "I", label = "India"},
                    {value = "J", label = "Juliett"},
                    {value = "K", label = "Kilo"},
                    {value = "L", label = "Lima"},
                    {value = "M", label = "Mike"},
                    {value = "N", label = "November"},
                    {value = "O", label = "Oscar"},
                    {value = "P", label = "Papa"},
                    {value = "Q", label = "Quebec"},
                    {value = "R", label = "Romeu"},
                    {value = "S", label = "Sierra"},
                    {value = "T", label = "Tango"},
                    {value = "U", label = "Uniform"},
                    {value = "V", label = "Victor"},
                    {value = "W", label = "Whiskey"},
                    {value = "X", label = "X-Ray"},
                    {value = "Y", label = "Yankee"},
                    {value = "Z", label = "Zulu"},
                },
                required = true
            },
        })
        if input then
            local callsignType = ""
            if input[1] == "Nenhuma" then
                local currentCallsign = ESX.PlayerData.Metadata.callsign
                if currentCallsign then
                    callsignType = currentCallsign:match("(%d+)")
                end
            else
                local selectedLetters = {}
                for _, v in ipairs(input[1]) do
                    table.insert(selectedLetters, v)
                end
                callsignType = table.concat(selectedLetters, "")
            end
            TriggerServerEvent("mn_callsign:server:setCallsign", callsignType)
        end
    end
end)