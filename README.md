# dynyx-gym
This is a Advanced Gym System were players can workout to gain strength and stamina.

| Join my discord server [here](https://discord.gg/A4gVRjnvaE) |
| ------------------------------------------------------------ |

## Preview: https://youtu.be/sbJX8-YOzSk

## How to Install
1. Drag dynyx-gym into your resources folder then ensure dynyx-gym in your cfg file.
2. Go to qb-core/shared/items.lua and paste this
```lua
--Dynyx-Gym
["gym_pass"]				 = {["name"] = "gym_pass", 					["label"] = "Gym Membership", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "gym_pass.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Lifetime Gym Membership"},

```
3. If using ox_inventory paste the following in ox_inventory / data / items.lua
```lua
	["gym_pass"] = {
		label = "Gym Membership",
		weight = 0,
		close = true,
		stack = false,
		description = "Lifetime Gym Membership",
		client = {
			image = "gym_pass.png",
		}
	},
```
4. Go to qb-inventory or lj-inventory / html / images and add in the images I put in that images folder.
5. If you are using ox_inventory go to ox_inventory / web / images and in the images I put in that image folder.
6. Make sure to intall all the Dependencies.
7. IF YOU ARE USING OX_LIB UNCOMMENT "@ox_lib/init.lua", IN fxmanifest.lua


## Dependencies
# mz-skills: https://github.com/GreenSlayer/mz-skills
# Gym MLO: https://www.gta5-mods.com/maps/mlo-pump-run-gym-add-on-sp-fivem-ragemp
# qb-core: https://github.com/qbcore-framework/qb-core
# PS-UI: https://github.com/Project-Sloth/ps-ui
OR
# qb-lock: https://github.com/Nathan-FiveM/qb-lock

## Supports 
# OX_LIB: https://github.com/overextended/ox_lib

# Configuration
```
Config = {}

Config.Target = 'qb' -- ox / qb
Config.Menu = 'qb' -- ox / qb
Config.Progressbar = 'qb' -- ox / qb
Config.Inventory = 'qb' -- ox / qb
Config.Notifications = 'qb' -- ox / qb

Config.GymPed = "a_m_y_clubcust_04" --  Ped Model of the Ped you buy a membership
Config.GymPedSpawn = vector4(-1255.53, -354.77, 35.96, 296.64) -- Location of the Ped you buy membership and Blip Location
Config.BlipName = 'Gym' -- Blip Name

Config.GymPassPrice = 1250 --  Price of Membership
Config.GymPassItem = 'gym_pass' -- Item Name of Gym Membership

Config.EnableMinigame = true -- (true == Enables Minigame) (false == Disables Minigame)
Config.Minigame = 'skillCheck' -- qb-lock / ps-ui / skillCheck (Ox_lib Required)(If using skillcheck, Minigame setting wont work)


Config.Skills = {
    ['ThreadMills'] = {
        skill = 'Stamina', -- The Type of Skill
        amount = math.random(0, 1),  -- The amount of skill rep you gain
        Stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
        ProgressbarDuration = math.random(1000, 2500), -- This is the duration for the progressbar
        Minigame = { -- Circle Minigame
            time = 5,
            circles = 1,
            FailedMinigameStress = math.random(10, 15) -- If you failed the minigame you will gain stress as a punishment for failing it
        }
    },
    ['Chinups'] = {
        skill = 'Strength', -- The Type of Skill
        amount = math.random(0, 2),  -- The amount of skill rep you gain
        Stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
        ProgressbarDuration = math.random(6000, 12000), -- This is the duration for the progressbar
        Minigame = { -- Circle Minigame
            time = 20,
            circles = 7,
            FailedMinigameStress = math.random(10, 15) -- If you failed the minigame you will gain stress as a punishment for failing it
        }, 
        ChinupAnimCoords = vector4(-1258.79, -355.49, 35.96, 338.63),
        ChinupAnimCoords2 = vector4(-1257.45, -358.75, 35.96, 294.17)
    },
    ['LiftWeights'] = {
        skill = 'Strength', -- The Type of Skill
        amount = math.random(0, 2),  -- The amount of skill rep you gain
        Stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
        ProgressbarDuration = math.random(6000, 12000), -- This is the duration for the progressbar
        Minigame = { -- Circle Minigame
            time = 18,
            circles = 8,
            FailedMinigameStress = math.random(10, 15) -- If you failed the minigame you will gain stress as a punishment for failing it
        }
    },
    ['Yoga'] = {
        skill = 'Stamina', -- The Type of Skill
        amount = math.random(0, 0),  -- The amount of skill rep you gain
        Stress = math.random(15, 20), --RelieveStress -- You Can set the amount of Stress you relieve here
        ProgressbarDuration = math.random(7000, 12000), -- This is the duration for the progressbar
        Minigame = { -- Circle Minigame
            time = 18, 
            circles = 8,
            FailedMinigameStress = math.random(10, 15) -- If you failed the minigame you will gain stress as a punishment for failing it
        }
    },
}

Config.Threadmills = { -- Coords of each Threadmill
    [1] = {
        coords = vector3(-1257.55, -366.77, 36.96)
    },
    [2] = {
        coords = vector3(-1259.0, -367.58, 36.96)
    },
    [3] = {
        coords = vector3(-1260.41, -368.4, 36.96)
    },
    [4] = {
        coords = vector3(-1261.93, -369.09, 36.96)
    },
    [5] = {
        coords = vector3(-1263.23, -369.84, 36.96)
    },
    [6] = {
        coords = vector3(-1264.67, -370.58, 36.96)
    },
}

Config.LiftWeight = { -- Coords of each Weight
    [1] = {
        coords = vector3(-1268.11, -366.05, 36.99)
    },
    [2] = {
        coords = vector3(-1269.8, -362.56, 36.96)
    },
}
```
