local QBCore = exports['qb-core']:GetCoreObject()

function Notify(source, text, status)
    if Config.Notifications == "ox" then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'GYM',
            description = text,
            type = status
        })
    elseif Config.Notifications == "qb" then
        TriggerClientEvent('QBCore:Notify', source, text, status)
    else
        print("Config.Notifications is invalid.")
    end
end
RegisterServerEvent('dynyx_gym:BuyGymM', function()
    local src = source
    if Config.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        local cashcurr = Player.Functions.GetMoney('cash')

        if cashcurr >= Config.GymPassPrice then
            Player.Functions.RemoveMoney('cash', Config.GymPassPrice)
            Player.Functions.AddItem(Config.GymPassItem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.GymPassItem], "add")
        else
            Notify(src, 'Not Enough Money', 'error')
        end
    elseif Config.Inventory == 'ox' then
        local item = exports.ox_inventory:GetItem(src, "money")
        
        if item.count >= Config.GymPassPrice then
            exports.ox_inventory:RemoveItem(src, "money", Config.GymPassPrice)
            exports.ox_inventory:AddItem(src, Config.GymPassItem, 1)
        else
            Notify(src, 'Not Enough Money', 'error')
        end
    end
end)
