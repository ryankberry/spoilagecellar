name = "Spoilage Cellar"
author = "sexyeggroll"
version = "0.9.5"
forumthread = ""
description = "Spoilage cellar with option to set food spoilage and temperature. -- version 0.9.5, code has changed so make sure to remove your items from old cellar before updating mod or they may be gone"
icon_atlas = "modicon.xml"
icon = "modicon.tex"
 
api_version = 6

dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
priority = 4

local temp_counter = {

    {description = "-5", data = -5},
    {description = "-4", data = -4},
    {description = "-3", data = -3},
    {description = "-2", data = -2},
    {description = "-1", data = -1},
    {description = "0", data = 0},
    {description = "1", data = 1},
    {description = "2", data = 2},
    {description = "3", data = 3},
    {description = "4", data = 4},
    {description = "5", data = 5},
	
}

local position = {
    
    {description = "250", data = 250},
    {description = "225", data = 225},
    {description = "200", data = 200},
    {description = "175", data = 175},
    {description = "150", data = 150},
    {description = "125", data = 125},
    {description = "100", data = 100},
    {description = "75", data = 75},
    {description = "50", data = 50},
    {description = "25", data = 25},
    {description = "0", data = 0},
    {description = "-25", data = -25},
    {description = "-50", data = -50},
    {description = "-75", data = -75},
    {description = "-100", data = -100},
    {description = "-125", data = -125},
    {description = "-150", data = -150},
    {description = "-175", data = -175},
    {description = "-200", data = -200},
    {description = "-225", data = -225},
    {description = "-250", data = -250},

}

configuration_options =
{
	{
		name = "craft",
		label = "Craft",
		options =
	{
		{description = "Easy", data = "easy"},
		{description = "Normal", data = "normal"},
		{description = "Hard", data = "hard"},
	},
		default = "normal",
		hover = "Set the cellar craft difficulty",
	},

	--[[
	{
		name = "slots",
		label = "Slots",
		options =
	{
		{description = "20", data = 20},
		{description = "40", data = 40},
		{description = "60", data = 60},
		{description = "80", data = 80},
	},
		default = 80,
		hover = "Set the number of inventory slots of the cellar",
	},
	]]
	
	{
        name = "XPos",
        label = "UI x Position",
        options = position,
        default = 0,
    },
    
	{
        name = "YPos",
        label = "UI y Position",
        options = position,
        default = 200,
    },
	
	{
		name = "destroy",
		label = "Destroyable",
		options =
	{
		{description = "Destroyable On", data = "destroy_on"},
		{description = "Destroyable Player", data = "destroy_player"},
		{description = "Destroyable Off", data = "destroy_off"},
	},
		default = "destroy_on",
		hover = "Set if the spoilage cellar should be destroyable",
	},
	
	{
		name = "spoilage",
		label = "Food Spoilage",
		options =
	{
		{description = "Default", data = 1},
		{description = "Winter", data = 0.75},
		{description = "Ice Box", data = 0.5},
		{description = "Double Ice Box", data = 0.25},
		{description = "Stop Spoilage", data = 0},
		{description = "Max Spoilage", data = 999},
	},
		default = 1,
		hover = "Set the food spoilage rate of the cellar",
	},
	
	{
        name = "temperature",
        label = "Temperature",
        options = temp_counter,
        default = -1,
		hover = "Set the temperature of the cellar",
    },
}