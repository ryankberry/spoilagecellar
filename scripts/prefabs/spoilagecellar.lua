require "prefabutil"

local mod_perish = GetModConfigData("spoilage", "workshop-952373305")
local mod_temp =  GetModConfigData("temperature", "workshop-952373305")
local mod_destroy = GetModConfigData("destroy", "workshop-952373305")

local assets = {
	Asset("ANIM", "anim/spoilagecellar.zip"),
	Asset("ANIM", "anim/ui_chest_5x16.zip"),
}

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    inst.components.container:DropEverything()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
    inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	inst.components.container:DropEverything()
	inst.AnimState:PushAnimation("closed", false)
	inst.components.container:Close()	
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("closed", false)	
end

local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    
	inst.entity:AddAnimState()
    
	inst.entity:AddSoundEmitter()
	
	inst:AddTag("spoilagecellar")
	
	inst:AddTag("crsCustomPerishMult")
	inst.crsCustomPerishMult = mod_perish
	inst:AddTag("crsCustomTempDuration")
	inst.crsCustomTempDuration = mod_temp
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("spoilagecellar.tex")
	
    inst.AnimState:SetBank("spoilagecellar")
    inst.AnimState:SetBuild("spoilagecellar")
	inst.AnimState:PlayAnimation("closed")
	
	inst:AddComponent("container")
    
    inst:AddComponent("inspectable")
    
	inst:AddComponent("lootdropper")
	
	if mod_destroy ~= "destroy_off" then
		inst:AddComponent("workable")
		inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
		inst.components.workable:SetWorkLeft(5)
		inst.components.workable:SetOnFinishCallback(onhammered)
		inst.components.workable:SetOnWorkCallback(onhit)
	end

	return inst
end

return Prefab( "common/spoilagecellar", fn, assets),
		MakePlacer("common/spoilagecellar_placer", "spoilagecellar", "spoilagecellar", "closed") 