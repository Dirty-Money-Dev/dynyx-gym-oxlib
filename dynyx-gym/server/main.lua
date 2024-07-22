local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('gym:server:LifePass', function(source, cb, LifePrice)
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

QBCore.Functions.CreateCallback('gym:server:TempPass', function(source, cb, TempPrice)
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

RegisterServerEvent('gym:server:GiveLife', function(LifePrice, LifeItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashAmount = Player.Functions.GetMoney('cash')
    local bankAmount = Player.Functions.GetMoney('bank')

    if cashAmount >= LifePrice then
        Player.Functions.RemoveMoney('cash', LifePrice)
        Player.Functions.AddItem(LifeItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[LifeItem], "add")
    elseif bankAmount >= LifePrice then
        Player.Functions.RemoveMoney('bank', LifePrice)
        Player.Functions.AddItem(LifeItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[LifeItem], "add")
    end
end)

RegisterServerEvent('gym:server:GiveTemp', function(TempPrice, TempItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashAmount = Player.Functions.GetMoney('cash')
    local bankAmount = Player.Functions.GetMoney('bank')

    if cashAmount >= TempPrice then
        Player.Functions.RemoveMoney('cash', TempPrice)
        Player.Functions.AddItem(TempItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[TempItem], "add")
    elseif bankAmount >= TempPrice then
        Player.Functions.RemoveMoney('bank', TempPrice)
        Player.Functions.AddItem(TempItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[TempItem], "add")
    end
end)