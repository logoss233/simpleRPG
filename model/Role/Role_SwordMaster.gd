extends Role
class_name Role_SwordMaster

func _init():
	mingzi="雷恩" #名字
	title="剑圣" #称号
	description=""
	propertyList=[{
		"hp":60,
		"mp":0,
		"atk":7,
		"def":4,
		"speed":6
	},
	{
		"hp":120,
		"mp":0,
		"atk":14,
		"def":8,
		"speed":12
	},
	{
		"hp":180,
		"mp":0,
		"atk":21,
		"def":12,
		"speed":18
	}
	]
	
	skillList=[Skill_Crit.new()]