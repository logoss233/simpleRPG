extends Role
class_name Role_AntiMagic

func _init():
	mingzi="希尔" #名字
	title="敌法师" #称号
	description=""
	propertyList=[{
		"hp":90,
		"mp":0,
		"atk":5,
		"def":6,
		"speed":5
	},
	{
		"hp":180,
		"mp":0,
		"atk":10,
		"def":12,
		"speed":10
	},
	{
		"hp":270,
		"mp":0,
		"atk":15,
		"def":18,
		"speed":15
	}
	]
	
	skillList=[Skill_AntiMagic.new()]