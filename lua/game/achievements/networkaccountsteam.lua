CustomAchiHandler = CustomAchiHandler or {}
CustomAchiHandler.stats = CustomAchiHandler.stats or {}

local get_stat_orig = NetworkAccountSTEAM.get_stat
function NetworkAccountSTEAM:get_stat(key, ...)
	local res = get_stat_orig(key, ...)
	
	if CustomAchiHandler.stats[key] then
		return CustomAchiHandler.stats[key]
	else
		CustomAchiHandler.stats[key] = 0
		return 0
	end
end

local publish_orig = NetworkAccountSTEAM.publish_statistics
function NetworkAccountSTEAM:publish_statistics(stats, ...)
	if debug.getinfo(2).name == 'award_progress' then
		for k,v in pairs(stats) do
			CustomAchiHandler.stats[k] = CustomAchiHandler.stats[k] + v.value
		end
		CustomAchiHandler.needs_saving = true
	end
	publish_orig(self, stats, ...)
end