local QBCore = exports['qb-core']:GetCoreObject()
local lib = exports['ox_lib']

CreateThread(function()
    exports['qb-target']:AddBoxZone("gymnpc", config.GymNPC.pedspawn, 1.5, 1.5, {
        name = "gymnpc",
        heading = 0,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 39.0,
      }, {
        options = {
          {
            type = "client",
            event = "dynyx-gym:OpenMemberBuy",
            icon = 'fas fa-card',
            label = 'Buy Membership'
          },
        },
        distance = 2.0
        })

end)

lib.registerContext({
  id = 'GymShopMenu',
  title = 'Gym Membership',
  options =
    {
      title = 'Welcome to Flex & Pump! Purchase a Gym Membership to use our equipment!',
      disabled = true,
    },
    {
      title = 'Buy Temporary Pass',
      description = "$"..config.GymPass.TempPrice,
      event = 'dynyx-gym:client:BuyTemp'
    },
    {
      title = 'Buy Lifetime Pass',
      description = "$"..config.GymPass.LifePrice,
      event = 'dynyx-gym:client:BuyLife'
    }
})

RegisterNetEvent("dynyx-gym:client:BuyTemp", function(data)
  local TempItem = config.GymPass.TempItem
  local TempPrice = config.GymPass.TempPrice

  QBCore.Functions.TriggerCallback('dynyx-gym:server:TempPass', function(money)
      if money then
        QBCore.Functions.Progressbar('random_task', 'Processing Purchase', 3000, false, false, {
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
        }, {
          animDict = "missheistdockssetup1clipboard@base",
          anim = "base",
          flags = 8,
        }, {}, {}, function()
          GiveTemp(true, TempPrice, TempItem)
          end)
      end
  end, TempPrice)
end)

RegisterNetEvent("dynyx-gym:client:BuyLife", function(data)
  local LifeItem = config.GymPass.LifeItem
  local LifePrice = config.Gympass.LifePrice

  QBCore.Functions.TriggerCallback('dynyx-gym:server:LifePass', function(money)
    if money then
      QBCore.Functions.Progressbar('random_task', 'Processing Purchase', 3000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = "missheistdockssetup1clipboard@base",
        anim = "base",
        flags = 8,
      }, {}, {}, function()
        GiveLife(true, LifePrice, LifeItem)
      end)
    end
  end, LifePrice)
end)

local function GiveTemp(bool, TempPrice, TempItem)
  TriggerServerEvent('dynyx-gym:server:GiveTemp', TempPrice, TempItem)
end

local function GiveLife(bool, LifePrice, LifeItem)
  TriggerServerEvent('dynyx-gym:server:GiveLife', LifePrice, LifeItem)
end

CreateThread(function()
  RequestModel( GetHashKey( config.GymNPC.pedname ) )
  while ( not HasModelLoaded( GetHashKey( config.GymNPC.pedname ) ) ) do
      Citizen.Wait( 1 )
  end
  gymnpc = CreatePed(1, config.GymNPC.pedhash, config.GymNPC.pedspawn, false, true)
  FreezeEntityPosition(gymnpc, true)
  SetEntityInvincible(gymnpc, true)
  SetBlockingOfNonTemporaryEvents(gymnpc, true)
  TaskStartScenarioInPlace(gymnpc, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end)

CreateThread(function()
  MakeBlips()
end)

function MakeBlips()
  Gym = AddBlipForCoord(vector3(-1262.78, -360.72, 36.99))
  SetBlipSprite (Gym, 311)
  SetBlipDisplay(Gym, 4)
  SetBlipScale  (Gym, 0.65)
  SetBlipAsShortRange(Gym, false)
  SetBlipColour(Gym, 7)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Gym')
  EndTextCommandSetBlipName(Gym)
end




