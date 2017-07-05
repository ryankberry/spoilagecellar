PrefabFiles = {
	"spoilagecellar",
}

Assets = 
{
	Asset("ATLAS", "minimap/spoilagecellar.xml"),
	Asset("ATLAS", "images/inventoryimages/spoilagecellar.xml"),
}

STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
Vector3 = GLOBAL.Vector3
IsDLCEnabled = GLOBAL.IsDLCEnabled
RoG = GLOBAL.REIGN_OF_GIANTS
SW = GLOBAL.CAPY_DLC

--local mod_slots = GetModConfigData("slots_mod")
local mod_craft = GetModConfigData("craft")
local sw_DLC = IsDLCEnabled(SW)

-- MAP ICONS --

AddMinimapAtlas("minimap/spoilagecellar.xml")

-- STRINGS --

STRINGS.NAMES.SPOILAGECELLAR = "Spoilage Cellar"
STRINGS.RECIPE_DESC.SPOILAGECELLAR = "Fresh!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SPOILAGECELLAR = "No spoilage, No problem!"

-- RECIPES --

local function modrecipe()

	if mod_craft=="easy" then
		cutstone_value = 11
		boards_value = 11
		limestone_value = 4
		marble_value = 4
	elseif mod_craft=="hard" then
		cutstone_value = 20
		boards_value = 20
		limestone_value = 4
		marble_value = 4
	else
		cutstone_value = 30
		boards_value = 30
		limestone_value = 10
		marble_value = 10
	end
end
modrecipe()

if sw_DLC == true then
	spoilagecellar0 = Recipe("spoilagecellar",{ Ingredient("cutstone", cutstone_value), Ingredient("limestone", limestone_value), Ingredient("boards", boards_value) }, RECIPETABS.TOWN, TECH.SCIENCE_TWO, GLOBAL.RECIPE_GAME_TYPE.COMMON, "spoilagecellar_placer")
	spoilagecellar1 = Recipe("spoilagecellar",{ Ingredient("cutstone", cutstone_value), Ingredient("marble", marble_value), Ingredient("boards", boards_value) }, RECIPETABS.TOWN, TECH.SCIENCE_TWO, GLOBAL.RECIPE_GAME_TYPE.ROG, "spoilagecellar_placer")
	spoilagecellar2 = Recipe("spoilagecellar",{ Ingredient("cutstone", cutstone_value), Ingredient("marble", marble_value), Ingredient("boards", boards_value) }, RECIPETABS.TOWN, TECH.SCIENCE_TWO, GLOBAL.RECIPE_GAME_TYPE.VANILLA, "spoilagecellar_placer")
	
	spoilagecellar0.atlas = "images/inventoryimages/spoilagecellar.xml"
	spoilagecellar1.atlas = "images/inventoryimages/spoilagecellar.xml"
	spoilagecellar2.atlas = "images/inventoryimages/spoilagecellar.xml"
else
	spoilagecellar0 = Recipe("spoilagecellar",{ Ingredient("cutstone", cutstone_value), Ingredient("marble", marble_value), Ingredient("boards", boards_value) }, RECIPETABS.TOWN, TECH.SCIENCE_TWO, "spoilagecellar_placer")
	spoilagecellar0.atlas = "images/inventoryimages/spoilagecellar.xml"
end

-- CONTAINER --

AddPrefabPostInit("spoilagecellar", function(inst)	
	
	local slotpos = {}
	for y = 4, 0, -1 do
		for x = 0, 15 do
			table.insert(slotpos, Vector3(80*x-346*2+91, 80*y-100*2+42,0))
		end
	end
	
	inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
	inst.components.container.widgetpos = Vector3(GetModConfigData("XPos"),GetModConfigData("YPos"),0)
	inst.components.container.widgetanimbank = "ui_chest_5x16"
	inst.components.container.widgetanimbuild = "ui_chest_5x16"
	inst.components.container.side_align_tip = 160
	
end)

-- ON OPEN/CLOSED --

local function onOpen(inst)
	inst.AnimState:PlayAnimation("open")
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
end 

local function onClose(inst)
	inst.AnimState:PlayAnimation("closed")
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
end

AddPrefabPostInit("spoilagecellar", function(inst)
    inst.components.container.onopenfn = onOpen
    inst.components.container.onclosefn = onClose
end)