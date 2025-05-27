local activeMsgs = {}

draw3dText = function(coords, text, index)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(229, 166, 255, 255)
    SetTextScale(0.0, 0.38 * scale)
    SetTextFont(4)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords.x, coords.y, coords.z + (index * 0.2), 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

displayText = function(ped, text)
    local messageId = #activeMsgs + 1
    activeMsgs[messageId] = {
        text = text,
        startTime = GetGameTimer()
    }
    
    CreateThread(function()
        local startTime = GetGameTimer()
        while GetGameTimer() <= startTime + 6500 do
            Wait(0)
            if not DoesEntityExist(ped) then return end
            
            local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.0)
            
            local index = 0
            for id, message in pairs(activeMsgs) do
                if message and GetGameTimer() <= message.startTime + 6500 then
                    draw3dText(pos, message.text, index)
                    index = index + 1
                else
                    activeMsgs[id] = nil
                end
            end
        end
        activeMsgs[messageId] = nil
    end)
end

RegisterNetEvent('rk_invAddons:display3DText', function(text)
    local playerPed = PlayerPedId()
    if DoesEntityExist(playerPed) then
        displayText(playerPed, text)
    end
end)


