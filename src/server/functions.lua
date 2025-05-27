if Shared.Framework == 1 then
    ESX = exports.es_extended:getSharedObject()
elseif Shared.Framework == 2 then
    local QBCore = exports['qb-core']:GetCoreObject()
end

GetName = function(source)
    if Shared.Framework == 1 then -- ESX
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getName()
    elseif Shared.Framework == 2 then -- QBCore
        local player = QBCore.Functions.GetPlayer(source)
        return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
    end
end
