local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateCallback('dynyx-gym:server:LifePass', function(source, cb, LifePrice, LifeItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashAmount = Player.Functions.GetMoney('cash')
    local bankAmount = Player.Functions.GetMoney('bank')
    local callback = false

    if cashAmount >= LifePrice or bankAmount >= LifePrice then
        callback = true
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough money!', 'error')
    end
    cb(callback)
end)

RegisterServerEvent('dynyx-gym:server:GiveLife', function(LifePrice, LifeItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if cashAmount >= LifePrice then
        Player.Functions.RemoveMoney('cash', LifePrice)
        Player.Functions.AddItem(LifeItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[LifeItem], "add")
    end
end)

QBCore.Functions.CreateCallback('dynyx-gym:server:TempPass', function(source, cb, TempPrice, TempItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashAmount = Player.Functions.GetMoney('cash')
    local bankAmount = Player.Functions.GetMoney('bank')
    local callback = false

    if cashAmount >= TempPrice or bankAmount >= TempPrice then
        callback = true
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough money!', 'error')
    end
    cb(callback)
end)

RegisterServerEvent('dynyx-gym:server:GiveTemp', function(TempPrice, TempItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if cashAmount >= TempPrice then
        Player.Functions.RemoveMoney('cash', TempPrice)
        Player.Functions.AddItem(TempItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QbCore.Shared.Items[TempItem], "add")
    end
end)