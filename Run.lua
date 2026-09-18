local tweak_name = "groupai"
dofile(ModPath .. "tweak_data/groupaitweakdata.lua")
tweak_data[tweak_name .. "_vanilla"] = GroupAITweakData:new(tweak_data)
tweak_data[tweak_name .. "_37"] = GroupAITweakData_37:new(tweak_data)


PrintTable(tweak_data[tweak_name .. "_vanilla"].enemy_spawn_groups)
PrintTable(tweak_data[tweak_name .. "_37"].enemy_spawn_groups)

-- tweak_data[tweak_name .. "_vanilla"]:_set_overkill_290()
-- tweak_data[tweak_name .. "_37"]:_set_overkill_290()
-- log("_set_overkill_290")
-- local function search(path, value, value2)
--     if type(value) == "table" then
--         for k, v in pairs(value) do
--             search(path .. (type(k) == "number" and tostring("[" .. k .."]") or tostring("." .. k)), value[k], type(value2) == "table" and value2[k])
--         end
--     else
--         -- value2 = Application:digest_value(value2, false)
--         if value ~= value2 then
--             local changed = not value2 and "-" or value ~= value2 and "~" or "--"
--             log(changed .. "tweak_data." .. tweak_name .. path .. " = " .. (type(value) == "string" and tostring('"' .. value .. '"') or tostring(value)) .. (changed == "~" and " --" .. tostring(value2) or ""))
--         end
--     end
-- end

-- search("", tweak_data[tweak_name .. "_37"], tweak_data[tweak_name])

-- 	local difficulty = Global.game_settings and Global.game_settings.difficulty
-- log(difficulty)
-- local function search(path, value, value2)
--     if type(value) == "table" then
--         for k, v in pairs(value) do
--             search(path .. (type(k) == "number" and tostring("[" .. k .."]") or tostring("." .. k)), value[k], type(value2) == "table" and value2[k])
--         end
--     else
--         -- value2 = Application:digest_value(value2, false)
--         if value ~= value2 then
--             local changed = not value2 and "-" or value ~= value2 and "~" or "--"
--             log(changed .. "tweak_data." .. tweak_name .. path .. " = " .. (type(value) == "string" and tostring('"' .. value .. '"') or tostring(value)) .. (changed == "~" and " --" .. tostring(value2) or ""))
--         end
--     end
-- end

-- search("", tweak_data[tweak_name .. "_37"], tweak_data[tweak_name])

-- PrintTable(tweak_data.assets.spotter.server_lock)