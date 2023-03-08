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
  local hasItem = QBCore.Functions.HasItem(config.GymPass.item)
  if hasItem then
    Treadmill()
  else
    QBCore.Functions.Notify("You dont have a membership pass", "error")
  end
end)

RegisterNetEvent('dynyx-gym:chinup', function()
  local hasItem = QBCore.Functions.HasItem(config.GymPass.item)
  if hasItem then
    Chinup()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:chinup2', function()
  local hasItem = QBCore.Functions.HasItem(config.GymPass.item)
  if hasItem then
    Chinup2()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:liftweights', function()
  local hasItem = QBCore.Functions.HasItem(config.GymPass.item)
  if hasItem then
    LiftWeight()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:liftweights2', function()
  local hasItem = QBCore.Functions.HasItem(config.GymPass.item)
  if hasItem then
    LiftWeight2()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:yoga', function()
  local hasItem = QBCore.Functions.HasItem(config.GymPass.item)
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

function ChinupsAnim()
  local chinupfi = vector3(-1258.79, -355.49, 35.96)
  StartPlayerTeleport(PlayerId(), chinupfi.x, chinupfi.y, chinupfi.z, 338.63, false, false, true)

  while IsPlayerTeleportActive() do
    Citizen.Wait(0)
  end
end

function ChinupsAnim2()
  local chinupsec = vector3(-1257.45, -358.75, 35.96)
  StartPlayerTeleport(PlayerId(), chinupsec.x, chinupsec.y, chinupsec.z, 294.17, false, false, true)

  while IsPlayerTeleportActive() do
    Citizen.Wait(0)
  end
end


function Treadmill()
  QBCore.Functions.Progressbar('random_task', 'Jogging', config.Skills.ThreadMills.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
    }, {}, {}, function()
      TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          exports["mz-skills"]:UpdateSkill(config.Skills.ThreadMills.skill, config.Skills.ThreadMills.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.ThreadMills.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.ThreadMills.Minigame.FailedMinigameStress)
        end
      end, config.Skills.ThreadMills.Minigame.circles, config.Skills.ThreadMills.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.ThreadMills.Minigame.circles, config.Skills.ThreadMills.Minigame.time, success)
      if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
        exports["mz-skills"]:UpdateSkill(config.Skills.ThreadMills.skill, config.Skills.ThreadMills.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.ThreadMills.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
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
      ChinupsAnim(),
      TriggerEvent('animations:client:EmoteCommandStart', {"chinup"}) 
    }, {}, {}, function() 
       --------------------------------------------------------------------------------------------   ps-ui section
       ChinupsAnim()
       TriggerEvent('animations:client:EmoteCommandStart', {"chinup"}) 
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Minigame.FailedMinigameStress)
        end
      end, config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time, success)
      if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
        exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
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
      ChinupsAnim2(),
      TriggerEvent('animations:client:EmoteCommandStart', {"chinup"}) 
    }, {}, {}, function() 
      ChinupsAnim2()
      TriggerEvent('animations:client:EmoteCommandStart', {"chinup"}) 
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Minigame.FailedMinigameStress)
        end
      end, config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.Chinups.Minigame.circles, config.Skills.Chinups.Minigame.time, success)
      if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
        exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Chinups.Minigame.FailedMinigameStress)
      end
    end
  end)
end

TaskPlayAnim(ped, "world_human_muscle_free_weights", "base", 1.0, 1.0, 5000, 8)

function LiftWeight()
  local ped = PlayerPedId()
  QBCore.Functions.Progressbar('random_task', 'Lifting Weights', config.Skills.LiftWeights.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      TaskStartScenarioInPlace(ped, "world_human_muscle_free_weights", 0, true)
    }, {}, {}, function() 
      TaskStartScenarioInPlace(ped, "world_human_muscle_free_weights", 0, true)
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          -- Stops the animation
          TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          -- Stops the animation
          TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Minigame.FailedMinigameStress)
        end
      end, config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time, success)
      if success then
        -- Stops the animation
        TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
        exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        -- Stops the animation
        TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Minigame.FailedMinigameStress)
      end
    end
  end)
end

function LiftWeight2()
  local ped = PlayerPedId()
  QBCore.Functions.Progressbar('random_task', 'Lifting Weights', config.Skills.LiftWeights.ProgressbarDuration, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
      TaskStartScenarioInPlace(ped, "world_human_muscle_free_weights", 0, true)
    }, {}, {}, function() 
      TaskStartScenarioInPlace(ped, "world_human_muscle_free_weights", 0, true)
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
          TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
          TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
          QBCore.Functions.Notify("That did not feel too good..", "error")
          Wait(3000)
          TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Minigame.FailedMinigameStress)
        end
      end, config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
    elseif config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(config.Skills.LiftWeights.Minigame.circles, config.Skills.LiftWeights.Minigame.time, success)
      if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
        exports["mz-skills"]:UpdateSkill(config.Skills.LiftWeights.skill, config.Skills.LiftWeights.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.LiftWeights.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        TriggerEvent('animations:client:EmoteCommandStart', {"jog"}) 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
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
      TriggerEvent('animations:client:EmoteCommandStart', {"yoga"})
    }, {}, {}, function() 
      TriggerEvent('animations:client:EmoteCommandStart', {"yoga"})
       --------------------------------------------------------------------------------------------   ps-ui section
    if config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
        if success then
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          exports["mz-skills"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.amount)
          Wait(2000)
          TriggerServerEvent('hud:server:RelieveStress', config.Skills.Yoga.Stress)
          TriggerEvent('inventory:client:busy:status', false)
        else --failed
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
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        exports["mz-skills"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:RelieveStress', config.Skills.Yoga.Stress)
        TriggerEvent('inventory:client:busy:status', false)
      else --failed
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', config.Skills.Yoga.Minigame.FailedMinigameStress)
      end
    end
  end)
end

