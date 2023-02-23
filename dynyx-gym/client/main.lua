local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
  for k, v in pairs(config.Threadmills) do
    exports['qb-target']:AddBoxZone("treadmill"..k, vector3(v.coords.x, v.coords.y, v.coords.z-1), 1, 2, {
      name = "treadmill",
      heading = 300,
      debugPoly = false,
      minZ = 30.0,
      maxZ = 39.0,
    }, {
      options = {
        {
          type = "client",
          event = "dynyx-gym:treadmill",
          icon = "fas fa-person-running",
          label = 'Use Treadmill'
        },
      },
      distance = 2.0
      })


      exports['qb-target']:AddBoxZone("chinups", vector3(-1258.97, -356.16, 36.99), 1, 2, {
        name = "chinups",
        heading = 300.0,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 39.0,
      }, {
        options = {
          {
            type = "client",
            event = 'dynyx-gym:chinup',
            icon = "fa-solid fa-arrow-up",
            label = 'Do Chinups'
            },
        },
        distance = 2.0
      })

      exports['qb-target']:AddBoxZone("chinups2", vector3(-1257.71, -358.84, 36.99), 1, 2, {
        name = "chinups2",
        heading = 300.0,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 39.0,
      }, {
        options = {
          {
            type = "client",
            event = 'dynyx-gym:chinup2',
            icon = "fa-solid fa-arrow-up",
            label = 'Do Chinups'
            },
        },
        distance = 2.0
      })
      exports['qb-target']:AddBoxZone("liftweights", vector3(-1268.11, -366.05, 36.99), 1, 2, {
        name = "liftweights",
        heading = 300.0,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 39.0,
      }, {
        options = {
          {
            type = "client",
            event = 'dynyx-gym:liftweights',
            icon = "fas fa-dumbbell",
            label = 'Lift Weights'
            },
        },
        distance = 2.0
      })
      exports['qb-target']:AddBoxZone("liftweights2", vector3(-1269.8, -362.56, 36.96), 1, 2, {
        name = "liftweights2",
        heading = 300.0,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 39.0,
      }, {
        options = {
          {
            type = "client",
            event = 'dynyx-gym:liftweights2',
            icon = "fas fa-dumbbell",
            label = 'Lift Weights'
            },
        },
        distance = 2.0
      })
      exports['qb-target']:AddBoxZone("yoga", vector3(-1262.34, -360.87, 36.96), 5, 5, {
        name = "yoga",
        heading = 300.0,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 39.0,
      }, {
        options = {
          {
            type = "client",
            event = 'dynyx-gym:yoga',
            icon = "fas fa-face-smile",
            label = 'Start Yoga'
            },
        },
        distance = 2.0
      })
    end
end)

RegisterNetEvent('dynyx-gym:treadmill', function()
  local hasItem = QBCore.Functions.HasItem('gym_pass')
  if hasItem then
    Treadmill()
  else
    QBCore.Functions.Notify("You dont have a membership pass", "error")
  end
end)

RegisterNetEvent('dynyx-gym:chinup', function()
  local hasItem = QBCore.Functions.HasItem('gym_pass')
  if hasItem then
    Chinup()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:chinup2', function()
  local hasItem = QBCore.Functions.HasItem('gym_pass')
  if hasItem then
    Chinup2()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:liftweights', function()
  local hasItem = QBCore.Functions.HasItem('gym_pass')
  if hasItem then
    LiftWeight()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:liftweights2', function()
  local hasItem = QBCore.Functions.HasItem('gym_pass')
  if hasItem then
    LiftWeight2()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:yoga', function()
  local hasItem = QBCore.Functions.HasItem('gym_pass')
  if hasItem then
    Yoga()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

local function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      Wait(3)
  end
end


local function ChinupsAnim()
  RequestAnimDict("amb@prop_human_muscle_chin_ups@male@base")
  while not HasAnimDictLoaded("amb@prop_human_muscle_chin_ups@male@base") do Wait(50) end
  local ped = PlayerPedId()
  local pos2 = vector4(-1258.79, -355.49, 36.96, 338.63)
  SetEntityHeading(ped, pos2.w)
  Wait(100)
  local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
  local netscene = NetworkCreateSynchronisedScene(pos2.x, pos2.y, pos2.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
  local x, y, z = table.unpack(GetEntityCoords(ped))
  NetworkAddPedToSynchronisedScene(ped, netscene, "amb@prop_human_muscle_chin_ups@male@base", "base", 1.5, -4.0, 1, 16, 1148846080, 0)
  SetPedComponentVariation(ped, 5, 0, 0, 0)
  NetworkStartSynchronisedScene(netscene)
end

local function ChinupsAnim2()
  RequestAnimDict("amb@prop_human_muscle_chin_ups@male@base")
  while not HasAnimDictLoaded("amb@prop_human_muscle_chin_ups@male@base") do Wait(50) end
  local ped = PlayerPedId()
  local pos2 = vector4(-1257.45, -358.75, 36.96, 294.17)
  SetEntityHeading(ped, pos2.w)
  Wait(100)
  local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
  local netscene = NetworkCreateSynchronisedScene(pos2.x, pos2.y, pos2.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
  local x, y, z = table.unpack(GetEntityCoords(ped))
  NetworkAddPedToSynchronisedScene(ped, netscene, "amb@prop_human_muscle_chin_ups@male@base", "base", 1.5, -4.0, 1, 16, 1148846080, 0)
  SetPedComponentVariation(ped, 5, 0, 0, 0)
  NetworkStartSynchronisedScene(netscene)
end

function Treadmill()
  QBCore.Functions.Progressbar('random_task', 'Jogging', config.Skills.ThreadMills.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      animDict = "move_m@jogger",
      anim = "idle",
      flags = 8,
    }, {}, {}, function() 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          exports["mz-skills"]:UpdateSkill(config.Skills.ThreadMills.skill, config.Skills.ThreadMills.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.ThreadMills.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.ThreadMills.Minigame.FailedMinigameStress)
        end
      end, config.Skills.ThreadMills.Minigame.circles, config.Skills.ThreadMills.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.ThreadMills.Minigame.circles, config.Skills.ThreadMills.Minigame.time, success)
      if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"dance"})
        Wait(100)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        exports["mz-skills"]:UpdateSkill(config.Skills.ThreadMills.skill, config.Skills.ThreadMills.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.ThreadMills.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.ThreadMills.Minigame.FailedMinigameStress)
      end
    end
  end)
end


function Chinup()
  QBCore.Functions.Progressbar('random_task', 'Doing Chin-ups', config.Skills.Chinups.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      ChinupsAnim()
    }, {}, {}, function() 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Minigame.FailedMinigameStress)
        end
      end, config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time, success)
      if success then
        exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Minigame.FailedMinigameStress)
      end
    end
  end)
end


function Chinup2()
  QBCore.Functions.Progressbar('random_task', 'Doing Chin-ups', config.Skills.Chinups.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      ChinupsAnim2()
    }, {}, {}, function() 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Minigame.FailedMinigameStress)
        end
      end, config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time, success)
      if success then
        exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Minigame.FailedMinigameStress)
      end
    end
  end)
end


function LiftWeight()
  QBCore.Functions.Progressbar('random_task', 'Lifting Weights', config.Skills.LiftWeights.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      animDict = "amb@world_human_muscle_free_weights@male@barbell@base",
      anim = "base",
      flags = 8,
    }, {}, {}, function() 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Minigame.FailedMinigameStress)
        end
      end, config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time, success)
      if success then
        exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Minigame.FailedMinigameStress)
      end
    end
  end)
end

function LiftWeight2()
  QBCore.Functions.Progressbar('random_task', 'Lifting Weights', config.Skills.LiftWeights.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      animDict = "amb@world_human_muscle_free_weights@male@barbell@base",
      anim = "base",
      flags = 8,
    }, {}, {}, function() 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Minigame.FailedMinigameStress)
        end
      end, config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time, success)
      if success then
        exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Minigame.FailedMinigameStress)
      end
    end
  end)
end



function Yoga()
  QBCore.Functions.Progressbar('random_task', 'Doing Yoga', config.Skills.Yoga.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      animDict = "missfam5_yoga",
      anim = "i_yogapose_a",
      flag = 8,
    }, {}, {}, function() 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          TriggerEvent('animations:client:EmoteCommandStart', {"dance"})
          Wait(100)
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          exports["mz-skills"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:RelieveStress', config.Skills.Yoga.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          TriggerEvent('animations:client:EmoteCommandStart', {"dance"})
          Wait(100)
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Yoga.Minigame.FailedMinigameStress)
        end
      end, config.Skills.Yoga.Minigame.circles, config.Skills.Yoga.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.Yoga.Minigame.circles, config.Skills.Yoga.Minigame.time, success)
      if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"dance"})
        Wait(100)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        exports["mz-skills"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:RelieveStress', config.Skills.Yoga.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        TriggerEvent('animations:client:EmoteCommandStart', {"dance"})
        Wait(100)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Yoga.Minigame.FailedMinigameStress)
      end
    end
  end)
end

