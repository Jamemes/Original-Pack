local mod_path = ModPath
Hooks:Add("BeardLibCreateScriptDataMods", "OriginalPackCore", function()
	BeardLib:ReplaceScriptData(mod_path .. "assets/OrPack.credits", "custom_xml", "gamedata/OP", "credits", true)
end)
