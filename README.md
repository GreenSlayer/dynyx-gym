# dynyx-gym
This is a Advanced Gym System were players can workout to gain strength and stamina.

| Join my discord server [here](https://discord.gg/A4gVRjnvaE) |
| ------------------------------------------------------------ |

## Preview: https://youtu.be/sbJX8-YOzSk

## How to Install
1. Drag dynyx-ring into your resources folder then ensure dynyx-rings in your cfg file.
2. Go to qb-core/shared/items.lua and paste this
```lua
--Dynyx-Gym
["gym_pass"]				 = {["name"] = "gym_pass", 					["label"] = "Gym Membership", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "gym_pass.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Lifetime Gym Membership"},

```
3. Go to qb-inventory or lj-inventory / html / images and add in the images I put in that images folder.
4. Make sure to intall all the Dependencies.


## Dependencies
# mz-skills: https://github.com/GreenSlayer/mz-skills
# Gym MLO: https://www.gta5-mods.com/maps/mlo-pump-run-gym-add-on-sp-fivem-ragemp
# Qbcore: https://github.com/qbcore-framework/qb-core

# Configuration
```
config = {}

config.GymNPC = {
    pedname = "a_m_y_clubcust_04", -- Name of the Ped
    pedhash = 0xE2210515, -- Hash Code for the Ped
    pedspawn = vector4(-1255.53, -354.77, 35.96, 296.64) --  Spawn for the Gym Membership Seller NPC
}

config.GymPass = {
    Price = 1250, -- Price for the Gym Membership
    item = "gym_pass" -- The Item Name for the Gym Membership
}

config.Skills = {
    ['ThreadMills'] = {
        skill = 'Stamina', -- The Type of Skill
        amount = math.random(0, 1),  -- The amount of skill rep you gain
        Stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
    },
    ['Chinups'] = {
        skill = 'Strength', -- The Type of Skill
        amount = math.random(0, 2),  -- The amount of skill rep you gain
        Stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
    },
    ['LiftWeights'] = {
        skill = 'Strength', -- The Type of Skill
        amount = math.random(0, 2),  -- The amount of skill rep you gain
        Stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
    },
    ['Yoga'] = {
        skill = 'Stamina', -- The Type of Skill
        amount = math.random(0, 0),  -- The amount of skill rep you gain
        Stress = math.random(10, 15), --RelieveStress -- You Can set the amount of Stress you relieve here
    },
}
```
