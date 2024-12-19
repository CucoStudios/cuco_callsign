local function generateCallsign()
    local callsign = tostring(math.random(0, 999))
    while #callsign < 3 do
        callsign = "0"..callsign
    end
    return callsign
end

local function contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

local lastJobName = {}

AddEventHandler("esx:playerLoaded", function(playerId, xPlayer, isNew)
    if not isNew then
        lastJobName[playerId] = xPlayer.job.name
        if contains(Config.callsignJobs, xPlayer.job.name) then
            if not xPlayer.getMetadata("callsign") then
                local callsign = generateCallsign()
                xPlayer.setMetadata("callsign", callsign)
            end
        else
            xPlayer.clearMetadata("callsign")
        end
    end
end)

AddEventHandler("esx:setJob", function(playerId, newJob, lastJob)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        if contains(Config.callsignJobs, newJob.name) and lastJob.name ~= newJob.name then
            local callsign = generateCallsign()
            xPlayer.setMetadata("callsign", callsign)
        elseif not contains(Config.callsignJobs, newJob.name) and contains(Config.callsignJobs, lastJob.name) and newJob.name ~= lastJobName[playerId] then
            xPlayer.clearMetadata("callsign")
        end
        lastJobName[playerId] = newJob.name
    end
end)

RegisterNetEvent("mn_callsign:server:setCallsign", function(callsignType)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local jobName = xPlayer.job.name
        if contains(Config.callsignJobs, jobName) then
            local currentCallsign = xPlayer.getMetadata("callsign")
            if currentCallsign then
                if callsignType == "Nenhuma" then
                    local callsignNumber = currentCallsign:match("(%d+)")
                    xPlayer.setMetadata("callsign", callsignNumber)
                else
                    local callsignNumber = currentCallsign:match("(%d+)")
                    local newCallsign = callsignType.."-"..callsignNumber
                    xPlayer.setMetadata("callsign", newCallsign)
                end
            end
        end
    end
end)

lib.addCommand("mycallsign", {help = "Ver Meu Callsign"}, function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local callsign = xPlayer.getMetadata("callsign")
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {description = "O Teu Callsign é: "..callsign.."", position = "top", type = "inform"})
    end
end)