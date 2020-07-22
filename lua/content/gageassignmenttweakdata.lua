local data = GageAssignmentTweakData.init
function GageAssignmentTweakData:init(tweak_data)
	data(self, tweak_data)
	self.assignments.green_mantis.aquire = 100
	self.assignments.yellow_bull.aquire = 100
	self.assignments.red_spider.aquire = 100
	self.assignments.blue_eagle.aquire = 100
	self.assignments.purple_snake.aquire = 100
end