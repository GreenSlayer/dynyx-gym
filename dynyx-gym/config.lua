-- |  https://discord.com/invite/A4gVRjnvaE    | For any support 

--Make sure you have this https://github.com/GreenSlayer/mz-skills


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

config.Minigame = 'ps-ui' -- qb-lock / ps-ui 


config.Skills = {
    ['ThreadMills'] = {
        skill = 'Stamina', -- The Type of Skill
        amount = math.random(0, 1),  -- The amount of skill rep you gain
        Stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
        ProgressbarDuration = math.random(1000, 2500), -- This is the duration for the progressbar
        Minigame = { -- Circle Minigame
            time = 23,
            circles = 8,
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
        }
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

-- Dont Touch the following
config.Threadmills = {
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
