local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
    if payload.action == 'move' and payload.toType == 'drop' then
        local playerName = GetName(payload.source)
        local message = string.format('* %s dropped Item(s) *', playerName)
        TriggerClientEvent('rk_invAddons:display3DText', -1, message)
    elseif payload.action == 'stack' then
        local playerName = GetName(payload.source)
        local message = string.format('* %s stacked Item(s) *', playerName)
        TriggerClientEvent('rk_invAddons:display3DText', -1, message)
    elseif payload.action == 'move' and string.match(payload.toInventory, '^glove[%w]+') then
        local playerName = GetName(payload.source)
        local message = string.format('* %s put Item(s) in glovebox *', playerName)
        TriggerClientEvent('rk_invAddons:display3DText', -1, message)
    elseif payload.action == 'move' and string.match(payload.fromInventory, '^glove[%w]+') then
        local playerName = GetName(payload.source)
        local message = string.format('* %s took Item(s) from glovebox *', playerName)
        TriggerClientEvent('rk_invAddons:display3DText', -1, message)
    elseif payload.action == 'move' and payload.toType == 'player' and payload.fromType == 'drop' then
        local playerName = GetName(payload.source)
        local message = string.format('* %s picked up Item(s) from the ground *', playerName)
        TriggerClientEvent('rk_invAddons:display3DText', -1, message)
    elseif payload.action == 'give' then
        local giverName = GetName(payload.source)
        local receiverName = GetName(payload.toInventory)
        local message = string.format('* %s gave Item(s) to %s *', giverName, receiverName)
        TriggerClientEvent('rk_invAddons:display3DText', -1, message)
    elseif payload.action == 'move' and payload.toType == 'player' and payload.fromType == 'player' and payload.source ~= payload.toInventory then
        local stealerName = GetName(payload.source)
        local victimName = GetName(payload.fromInventory)
        local message = string.format('* %s stole Item(s) from %s *', stealerName, victimName)
        TriggerClientEvent('rk_invAddons:display3DText', -1, message)
    end
    
    return true
end)
