local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}




-- Inventario
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.ESCTEMPLATE = {
	--comida
	"baconeggs","baconeggs",
	--pa cocinar
	"cutstone","cutstone","cutstone",
	"charcoal",	"charcoal",	"charcoal","charcoal","charcoal","charcoal",	
	"twigs","twigs","twigs","twigs","twigs","twigs",
}

local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.ESCTEMPLATE
end
local prefabs = FlattenTree(start_inv, true)

local function onbecamehuman(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "esctemplate_speed_mod", 1)
end

local function onbecameghost(inst)
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "esctemplate_speed_mod")
end

local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end


-- Inicialisacion xp
local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "esctemplate.tex" )
end

local master_postinit = function(inst,data)
	-- Inventario al comienzo
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	
	--soniditos
	inst.soundsname = "wolfgang"
	
	-- ponerle las stats	
	inst.components.health:SetMaxHealth(TUNING.ESCTEMPLATE_HEALTH)
	inst.components.hunger:SetMax(TUNING.ESCTEMPLATE_HUNGER)
    inst.components.hunger.hungerrate = 1.25 * TUNING.WILSON_HUNGER_RATE
	inst.components.sanity:SetMax(TUNING.ESCTEMPLATE_SANITY)
	
	-- Daño
    inst.components.combat.damagemultiplier = 0.75
	
	
    -- velocidad
	inst.components.locomotor.walkspeed = 4.1 - TUNING.ESCTEMPLATE_SPEED
	inst.components.locomotor.runspeed = 4.6 - TUNING.ESCTEMPLATE_SPEED
	
    if inst.components.eater ~= nil then
        inst.components.eater:SetPrefersEatingTag("preparedfood")
        inst.components.eater:SetPrefersEatingTag("pre-preparedfood")
    end

    inst:AddComponent("foodmemory")
    inst.components.foodmemory:SetDuration(TUNING.WARLY_SAME_OLD_COOLDOWN)
    inst.components.foodmemory:SetMultipliers(TUNING.WARLY_SAME_OLD_MULTIPLIERS)

    inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
end

--teoricamente solo come cosas cocinada

local function common_postinit(inst)
    inst:AddTag("masterchef")
    inst:AddTag("professionalchef")
    inst:AddTag("expertchef")

    inst.AnimState:AddOverrideBuild("player_idles_warly")
end




return MakePlayerCharacter("esctemplate", prefabs, assets, common_postinit, master_postinit, prefabs)
