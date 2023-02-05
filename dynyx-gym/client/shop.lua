local QBCore = exports['qb-core']:GetCoreObject()

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

RegisterNetEvent('dynyx-gym:OpenMemberBuy', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Welcome! Please Purchase a Gym Member to workout!",
        },
        {
          id = 2,
          header = "Buy Gym Membership",
          txt = "$"..config.GymPass.Price,
          params = {
              event = "dynyx-gym:LifetimeConfirm",
          }
      },
    })
end)

RegisterNetEvent('dynyx-gym:LifetimeConfirm', function()
    exports['qb-menu']:openMenu({
        {
          id = 1,
          header = "Go Back",
          params = {
              event = "dynyx-gym:OpenMemberBuy",
          }
      },
      {
        id = 2,
        header = "Confirm Purchase",
        params = {
            event = "dynyx-gym:client:Start",
        }
    },
    })
end)


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
  SetBlipAsShortRange(Gym, true)
  SetBlipColour(Gym, 7)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Gym')
  EndTextCommandSetBlipName(Gym)
end  

local function GivePass(bool, price, item)
  TriggerServerEvent('dynyx-gym:server:GivePass', price, item)
end



RegisterNetEvent("dynyx-gym:client:Start", function(data)
  local Item = config.GymPass.item
  local Price = config.GymPass.Price

  QBCore.Functions.TriggerCallback('dynyx-gym:server:CheckMoney', function(money)
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
          GivePass(true, Price, Item)
          end)
      end
  end, Price)
end)
