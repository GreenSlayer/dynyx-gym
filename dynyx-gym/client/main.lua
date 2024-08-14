local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
  for k, v in pairs(Config.Threadmills) do
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
  end
  for k, v in pairs(Config.LiftWeight) do
    exports['qb-target']:AddBoxZone("liftweights"..k, vector3(v.coords.x, v.coords.y, v.coords.z-1), 1, 2, {
      name = "liftweights",
      heading = 300,
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
  end
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
  exports['qb-target']:AddCircleZone("yoga", vector3(-1262.42, -360.93, 36.96), 3, {
    name = "yoga",
    debugPoly = false,
  }, {
    options = {
      {
        type = "client",
        event = "dynyx-gym:yoga",
        icon = 'fas fa-face-smile',
        label = 'Start Yoga',
      }
    },
    distance = 2.5,
  })
end)

RegisterNetEvent('dynyx-gym:treadmill', function()
  local hasItem = QBCore.Functions.HasItem(Config.GymPassItem)
  if hasItem then
    Treadmill()
  else
    QBCore.Functions.Notify("You dont have a membership pass", "error")
  end
end)

RegisterNetEvent('dynyx-gym:chinup', function()
  local hasItem = QBCore.Functions.HasItem(Config.GymPassItem)
  if hasItem then
    Chinup()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:chinup2', function()
  local hasItem = QBCore.Functions.HasItem(Config.GymPassItem)
  if hasItem then
    Chinup2()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:liftweights', function()
  local hasItem = QBCore.Functions.HasItem(Config.GymPassItem)
  if hasItem then
    LiftWeight()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

RegisterNetEvent('dynyx-gym:yoga', function()
  local hasItem = QBCore.Functions.HasItem(Config.GymPassItem)
  if hasItem then
    Yoga()
  else
    QBCore.Functions.Notify("You dont own a membership!", "error")
  end
end)

local function LoadAnimDict(dict)
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Wait(10)
  end
end

function ChinupsAnim()
  local ped = PlayerPedId()

  local chinup = Config.Skills.Chinups.ChinupAnimCoords
  SetEntityCoords(ped, chinup.x, chinup.y, chinup.z, false, false, false, true)
  SetEntityHeading(ped, chinup.w)
end

function ChinupsAnim2()
  local ped = PlayerPedId()

  local chinup = Config.Skills.Chinups.ChinupAnimCoords2
  SetEntityCoords(ped, chinup.x, chinup.y, chinup.z, false, false, false, true)
  SetEntityHeading(ped, chinup.w)
end

local function ThreadmillReward(results)
    if results == 'success' then
        exports["mz-skills"]:UpdateSkill(Config.Skills.ThreadMills.skill, Config.Skills.ThreadMills.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', Config.Skills.ThreadMills.Stress)
        TriggerEvent('inventory:client:busy:status', false)
    elseif results == 'failed' then
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', Config.Skills.ThreadMills.Minigame.FailedMinigameStress)
    end
end

local function StartThreadmillMinigame()
    --------------------------------------------------------------------------------------------   ps-ui section
    if Config.Minigame == 'ps-ui' then
        exports['ps-ui']:Circle(function(success)
            if success then
                ThreadmillReward('success')
            else --failed
                ThreadmillReward('failed')
            end
        end, Config.Skills.ThreadMills.Minigame.circles, Config.Skills.ThreadMills.Minigame.time)
        --------------------------------------------------------------------------------------------   qb-lock section
    elseif Config.Minigame == 'qb-lock' then
        local success = exports['qb-lock']:StartLockPickCircle(Config.Skills.ThreadMills.Minigame.circles, Config.Skills.ThreadMills.Minigame.time, success)
        if success then
            ThreadmillReward('success')
        else --failed
            ThreadmillReward('failed')
        end
    elseif Config.Minigame == 'skillCheck' then
        local success = lib.skillCheck({'easy', 'easy', 'medium', 'medium'}, {'w', 'a', 's', 'd'})
        if success then
            ThreadmillReward('success')
        else --failed
            ThreadmillReward('failed')
        end
    end
end

function Treadmill()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_JOG_STANDING", 0, true)
    if Config.Progressbar == 'qb' then
        QBCore.Functions.Progressbar('random_task', 'Jogging', Config.Skills.ThreadMills.ProgressbarDuration, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            StartThreadmillMinigame()
            ClearPedTasks(ped)
        end)
    elseif Config.Progressbar == 'ox' then
        exports.ox_inventory:Progress({
            duration = Config.Skills.ThreadMills.ProgressbarDuration,
            label = "Jogging",
            useWhileDead = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false,
            },
        }, function(cancel)
            if not cancel then
                StartThreadmillMinigame()
                ClearPedTasks(ped)
            end
        end)
    end
end

local function ChinupReward(results)
    if results == 'success' then
        exports["mz-skills"]:UpdateSkill(Config.Skills.Chinups.skill, Config.Skills.Chinups.amount)
        Wait(2000)
        TriggerServerEvent('hud:server:GainStress', Config.Skills.Chinups.Stress)
        TriggerEvent('inventory:client:busy:status', false)
    elseif results == 'failed' then
        QBCore.Functions.Notify("That did not feel too good..", "error")
        Wait(3000)
        TriggerServerEvent('hud:server:GainStress', Config.Skills.Chinups.Minigame.FailedMinigameStress)
    end
end

local function StartChinupMinigame()
    --------------------------------------------------------------------------------------------   ps-ui section
    if Config.Minigame == 'ps-ui' then
        exports['ps-ui']:Circle(function(success)
            if success then
                ChinupReward('success')
            else --failed
                ChinupReward('failed')
            end
        end, Config.Skills.Chinups.Minigame.circles, Config.Skills.Chinups.Minigame.time)
        --------------------------------------------------------------------------------------------   qb-lock section
    elseif Config.Minigame == 'qb-lock' then
        local success = exports['qb-lock']:StartLockPickCircle(Config.Skills.Chinups.Minigame.circles, Config.Skills.Chinups.Minigame.time, success)
        if success then
            ChinupReward('success')
        else --failed
            ChinupReward('failed')
        end
    elseif Config.Minigame == 'skillCheck' then
        local success = lib.skillCheck({'easy', 'easy', 'medium', 'medium'}, {'w', 'a', 's', 'd'})
        if success then
            ChinupReward('success')
        else --failed
            ChinupReward('failed')
        end
    end
end

function Chinup()
    local ped = PlayerPedId()
    ChinupsAnim()
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_MUSCLE_CHIN_UPS", 0, true)
    if Config.Progressbar == 'qb' then
        QBCore.Functions.Progressbar('random_task', 'Doing Chin-ups', Config.Skills.Chinups.ProgressbarDuration, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            StartChinupMinigame()
            ClearPedTasks(ped)
        end)
    elseif Config.Progressbar == 'ox' then
        exports.ox_inventory:Progress({
            duration = Config.Skills.Chinups.ProgressbarDuration,
            label = "Doing Chin-ups",
            useWhileDead = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false,
            },
        }, function(cancel)
            if not cancel then
                StartChinupMinigame()
                ClearPedTasks(ped)
            end
        end)
    end
end

function Chinup2()
  local ped = PlayerPedId()
  ChinupsAnim2()
  TaskStartScenarioInPlace(ped, "PROP_HUMAN_MUSCLE_CHIN_UPS", 0, true)
  if Config.Progressbar == 'qb' then
      QBCore.Functions.Progressbar('random_task', 'Doing Chin-ups', Config.Skills.Chinups.ProgressbarDuration, false, false, {
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
      }, {}, {}, {}, function()
          StartChinupMinigame()
          ClearPedTasks(ped)
      end)
  elseif Config.Progressbar == 'ox' then
      exports.ox_inventory:Progress({
          duration = Config.Skills.Chinups.ProgressbarDuration,
          label = "Doing Chin-ups",
          useWhileDead = false,
          disable = {
              move = true,
              car = true,
              combat = true,
              mouse = false,
          },
      }, function(cancel)
          if not cancel then
              StartChinupMinigame()
              ClearPedTasks(ped)
          end
      end)
  end
end

local function LiftWeightReward(results)
  if results == 'success' then
    exports["mz-skills"]:UpdateSkill(Config.Skills.LiftWeights.skill, Config.Skills.LiftWeights.amount)
    Wait(2000)
    TriggerServerEvent('hud:server:GainStress', Config.Skills.LiftWeights.Stress)
    TriggerEvent('inventory:client:busy:status', false)
  elseif results == 'failed' then
    QBCore.Functions.Notify("That did not feel too good..", "error")
    Wait(3000)
    TriggerServerEvent('hud:server:GainStress', Config.Skills.LiftWeights.Minigame.FailedMinigameStress)
  end
end

local function StartLiftWeightMinigame()
  --------------------------------------------------------------------------------------------   ps-ui section
  if Config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
          if success then
            LiftWeightReward('success')
          else --failed
            LiftWeightReward('failed')
          end
      end, Config.Skills.LiftWeights.Minigame.circles, Config.Skills.LiftWeights.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
  elseif Config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(Config.Skills.LiftWeights.Minigame.circles, Config.Skills.LiftWeights.Minigame.time, success)
      if success then
        LiftWeightReward('success')
      else --failed
        LiftWeightReward('failed')
      end
  elseif Config.Minigame == 'skillCheck' then
      local success = lib.skillCheck({'easy', 'easy', 'medium', 'medium'}, {'w', 'a', 's', 'd'})
      if success then
        LiftWeightReward('success')
      else --failed
        LiftWeightReward('failed')
      end
  end
end

function LiftWeight()
  local ped = PlayerPedId()
  TaskStartScenarioInPlace(ped, "world_human_muscle_free_weights", 0, true)
  if Config.Progressbar == 'qb' then
      QBCore.Functions.Progressbar('random_task', 'Lifting Weights', Config.Skills.LiftWeights.ProgressbarDuration, false, false, {
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
      }, {}, {}, {}, function()
          StartLiftWeightMinigame()
          ClearPedTasks(ped)
      end)
  elseif Config.Progressbar == 'ox' then
      exports.ox_inventory:Progress({
          duration = Config.Skills.LiftWeights.ProgressbarDuration,
          label = "Lifting Weights",
          useWhileDead = false,
          disable = {
              move = true,
              car = true,
              combat = true,
              mouse = false,
          },
      }, function(cancel)
          if not cancel then
              StartLiftWeightMinigame()
              ClearPedTasks(ped)
          end
      end)
  end
end

local function YogaReward(results)
  if results == 'success' then
    exports["mz-skills"]:UpdateSkill(Config.Skills.Yoga.skill, Config.Skills.Yoga.amount)
    Wait(2000)
    TriggerServerEvent('hud:server:RelieveStress', Config.Skills.Yoga.Stress)
    TriggerEvent('inventory:client:busy:status', false)
  elseif results == 'failed' then
    QBCore.Functions.Notify("That did not feel too good..", "error")
    Wait(3000)
    TriggerServerEvent('hud:server:GainStress', Config.Skills.Yoga.Minigame.FailedMinigameStress)
  end
end

local function StartYogaMinigame()
  --------------------------------------------------------------------------------------------   ps-ui section
  if Config.Minigame == 'ps-ui' then
      exports['ps-ui']:Circle(function(success)
          if success then
            YogaReward('success')
          else --failed
            YogaReward('failed')
          end
      end, Config.Skills.Yoga.Minigame.circles, Config.Skills.Yoga.Minigame.time)
      --------------------------------------------------------------------------------------------   qb-lock section
  elseif Config.Minigame == 'qb-lock' then
      local success = exports['qb-lock']:StartLockPickCircle(Config.Skills.Yoga.Minigame.circles, Config.Skills.Yoga.Minigame.time, success)
      if success then
        YogaReward('success')
      else --failed
        YogaReward('failed')
      end
  elseif Config.Minigame == 'skillCheck' then
      local success = lib.skillCheck({'easy', 'easy', 'medium', 'medium'}, {'w', 'a', 's', 'd'})
      if success then
        YogaReward('success')
      else --failed
        YogaReward('failed')
      end
  end
end

function Yoga()
  local ped = PlayerPedId()
  TaskStartScenarioInPlace(ped, "WORLD_HUMAN_YOGA", 0, true)
  if Config.Progressbar == 'qb' then
      QBCore.Functions.Progressbar('random_task', 'Yoga Exercising', Config.Skills.Yoga.ProgressbarDuration, false, false, {
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
      }, {}, {}, {}, function()
        StartYogaMinigame()
          ClearPedTasks(ped)
      end)
  elseif Config.Progressbar == 'ox' then
      exports.ox_inventory:Progress({
          duration = Config.Skills.Yoga.ProgressbarDuration,
          label = "Yoga Exercising",
          useWhileDead = false,
          disable = {
              move = true,
              car = true,
              combat = true,
              mouse = false,
          },
      }, function(cancel)
          if not cancel then
            StartYogaMinigame()
              ClearPedTasks(ped)
          end
      end)
  end
end
