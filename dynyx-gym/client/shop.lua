local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    -- Makes Blip
    Gym = AddBlipForCoord(Config.GymPedSpawn)
    SetBlipSprite(Gym, 311)
    SetBlipDisplay(Gym, 4)
    SetBlipScale(Gym, 0.65)
    SetBlipAsShortRange(Gym, true)
    SetBlipColour(Gym, 7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipName)
    EndTextCommandSetBlipName(Gym)
    -- Spawns Ped
    local PedCoords = Config.GymPedSpawn
    PedHash = GetHashKey(Config.GymPed)
    RequestModel(PedHash)
    while not HasModelLoaded(PedHash) do
        Citizen.Wait(1)
    end
    if HasModelLoaded(PedHash) then
        local GymPed = CreatePed(1, PedHash, PedCoords.x, PedCoords.y, PedCoords.z, PedCoords.w, false, true)
        FreezeEntityPosition(GymPed, true)
        SetEntityInvincible(GymPed, true)
        TaskStartScenarioInPlace(GymPed, "WORLD_HUMAN_CLIPBOARD", 0, true)
        SetBlockingOfNonTemporaryEvents(GymPed, true)
        if Config.Target == 'qb' then
          exports['qb-target']:AddBoxZone("gymnpc", vector3(PedCoords.x, PedCoords.y, PedCoords.z + 1), 1.5, 1.5, {
            name = "gymnpc",
            heading = 0,
            debugPoly = false,
            minZ = 30.0,
            maxZ = 39.0,
          }, {
            options = {
              {
                type = "client",
                event = "dynyx_gym:OpenMemberBuy",
                icon = 'fa-solid fa-book',
                label = 'Buy Membership'
              },
            },
            distance = 2.0
          })
        elseif Config.Target == 'ox' then
          exports.ox_target:addSphereZone({
            coords = vec3(PedCoords.x, PedCoords.y, PedCoords.z + 1),
            radius = 1,
            debug = false,
            options = {
                {
                    onSelect = function()
                        TriggerEvent('dynyx_gym:OpenMemberBuy')
                    end,
                    icon = 'fa-solid fa-book',
                    label = "Buy Membership",
                }
            }
          })
        else
          print("**Invalid Config.Target.**")
        end
    end
end)

RegisterNetEvent('dynyx_gym:OpenMemberBuy', function()
    if Config.Menu == 'qb' then
        exports['qb-menu']:openMenu({
            {
                id = 1,
                header = "Welcome! Please Purchase a Gym Member to workout!",
            },{
              id = 2,
              header = "Buy Gym Membership",
              txt = "$"..Config.GymPassPrice,
              params = {
                  event = "dynyx_gym:LifetimeConfirm",
              }
          },
        })
    elseif Config.Menu == 'ox' then
        lib.registerContext({
            id = 'GymMemberMenu1',
            title = 'Welcome! Please Purchase a Gym Membership to workout!',
            options = {
              {
                title = 'Buy Gym Membership',
                description = '$'..Config.GymPassPrice,
                arrow = true,
                icon = 'dollar',
                event = 'dynyx_gym:LifetimeConfirm',
              }
            }
        })
        lib.showContext('GymMemberMenu1')
    else
        print("**Invalid Config.Menu.**")
    end
end)

RegisterNetEvent('dynyx_gym:LifetimeConfirm', function()
    if Config.Menu == 'qb' then
        exports['qb-menu']:openMenu({
            {
                id = 1,
                header = "Go Back",
                params = {
                    event = "dynyx-gym:OpenMemberBuy",
                }
            },{
                id = 2,
                header = "Confirm Purchase",
                txt = "Purchase of $"..Config.GymPassPrice,
                params = {
                    event = "dynyx_gym:BuyCard",
                }
            },
        })
    elseif Config.Menu == 'ox' then
        lib.registerContext({
            id = 'GymMemberMenu2',
            title = 'Please Confirm.',
            options = {
              {
                title = 'Confirm Purchase',
                description = 'Purchase of $'..Config.GymPassPrice,
                icon = 'dollar',
                event = 'dynyx_gym:BuyCard',
              }
            }
        })
        lib.showContext('GymMemberMenu2')
    else
        print("**Invalid Config.Menu.**")
    end
end)

RegisterNetEvent('dynyx_gym:BuyCard', function()
    if Config.Progressbar == 'qb' then
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
              TriggerServerEvent('dynyx_gym:BuyGymM')
        end)
    elseif Config.Progressbar == 'ox' then
        exports.ox_inventory:Progress({
            duration = 3000,
            label = "Processing Purchase",
            useWhileDead = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false,
            },
            anim = {
                dict = "missheistdockssetup1clipboard@base",
                clip = "base",
                flags = 8,
            },
        }, function(cancel)
            if not cancel then
                TriggerServerEvent('dynyx_gym:BuyGymM')
            end
        end)
    else
        print("**Invalid Config.Progressbar.**")
    end
end)
