PrefabFiles = {
	"esctemplate",
	"esctemplate_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/esctemplate.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/esctemplate.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/esctemplate.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/esctemplate.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/esctemplate_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/esctemplate_silho.xml" ),

    Asset( "IMAGE", "bigportraits/esctemplate.tex" ),
    Asset( "ATLAS", "bigportraits/esctemplate.xml" ),
	
	Asset( "IMAGE", "images/map_icons/esctemplate.tex" ),
	Asset( "ATLAS", "images/map_icons/esctemplate.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_esctemplate.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_esctemplate.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_esctemplate.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_esctemplate.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_esctemplate.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_esctemplate.xml" ),
	
	Asset( "IMAGE", "images/names_esctemplate.tex" ),
    Asset( "ATLAS", "images/names_esctemplate.xml" ),
	
	Asset( "IMAGE", "images/names_gold_esctemplate.tex" ),
    Asset( "ATLAS", "images/names_gold_esctemplate.xml" ),
}

AddMinimapAtlas("images/map_icons/esctemplate.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- Descripciones 
STRINGS.CHARACTER_TITLES.esctemplate = "The useless"
STRINGS.CHARACTER_NAMES.esctemplate = "Heby"
STRINGS.CHARACTER_DESCRIPTIONS.esctemplate = "*His greatest wish is not to move\n*Has a fondness for eating,but its agourmet\n*Knows many things,but cannot use it"
STRINGS.CHARACTER_QUOTES.esctemplate = "\"Maybe a misunderstood genius\"" 
STRINGS.CHARACTER_SURVIVABILITY.esctemplate = "well...."


-- Speechs del personajes
STRINGS.CHARACTERS.ESCTEMPLATE = require "speech_esctemplate"

-- The character's name as appears in-game 
STRINGS.NAMES.ESCTEMPLATE = "Heby"
STRINGS.SKIN_NAMES.esctemplate_none = "Heby"

-- The skins shown in the cycle view window on the character select screen.
-- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
local skin_modes = {
    { 
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle", 
        scale = 0.75, 
        offset = { 0, -25 } 
    },
}

--recoger info de las stats personalizables 
TUNING.ESCTEMPLATE_HEALTH = GetModConfigData("health")
TUNING.ESCTEMPLATE_HUNGER = GetModConfigData("hunger")
TUNING.ESCTEMPLATE_SANITY = GetModConfigData("sanity")
TUNING.ESCTEMPLATE_SPEED = GetModConfigData("speed")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("esctemplate", "NEUTRAL", skin_modes)
