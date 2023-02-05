local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('dynyx-gym:server:GivePass', function(price, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

QBCore.Functions.CreateCallback('dynyx-gym:server:CheckMoney',function(source, cb, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CashAmount = Player.Functions.GetMoney('cash')
    local callback = false

    if CashAmount >= price then
        callback = true
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not Enough Money', 'error')
    end

    cb(callback)
end)