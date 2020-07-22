CustomAchiHandler = CustomAchiHandler or {}
CustomAchiHandler.stats = CustomAchiHandler.stats or {}

local completed_orig = StatisticsManager.completed_job
function StatisticsManager:completed_job(job_id, difficulty, require_one_down, ...)
	local res = completed_orig(self, job_id, difficulty, require_one_down, ...)
	
	local myid = job_id..'_'..difficulty
	if require_one_down then
		myid = myid..'_od'
	end
	
	if CustomAchiHandler.stats[myid] then
		return math.max(res - CustomAchiHandler.stats[myid], 0)
	else
		CustomAchiHandler.stats[myid] = res
		return 0
	end
end