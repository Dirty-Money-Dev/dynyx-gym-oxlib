# dynyx-gym
This is a Advanced Gym System were players can workout to gain strength and stamina.

| Join my discord server [here](https://discord.gg/A4gVRjnvaE) |
| ------------------------------------------------------------ |

## Preview: https://youtu.be/sbJX8-YOzSk

## How to Install
1. Drag dynyx-gym into your resources folder then ensure dynyx-gym in your cfg file.
2. Go to ox_inventory/data/items.lua and paste this:

```lua
--	["gym_pass"] = {
		label = "Gym Membership Card",
		weight = 0,
		stack = false,
		close = false,
		description = "A card verifying your gym membership status.",
		client = {
			image = "gym_pass.png",
		}
	},
```

3. Go to ox_inventory/web/images and add in the images I put in that images folder.
4. Make sure to install all the Dependencies.


## Dependencies
# mz-skills: https://github.com/GreenSlayer/mz-skills
# Gym MLO: https://www.gta5-mods.com/maps/mlo-pump-run-gym-add-on-sp-fivem-ragemp
# Ox Inventory: https://github.com/overextended/ox_inventory
# PS-UI: https://github.com/Project-Sloth/ps-ui
# Ox Lib: https://github.com/overextended/ox_lib/
OR
# qb-lock: https://github.com/Nathan-FiveM/qb-lock

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
```
