extends Role
class_name Role_Oracle

func _init():
	mingzi="奈非" #名字
	title="神使" #称号
	description=""
	propertyList=[{
		"hp":70,
		"mp":50,
		"atk":5,
		"def":6,
		"speed":5
	},
	{
		"hp":140,
		"mp":100,
		"atk":10,
		"def":12,
		"speed":10
	},
	{
		"hp":210,
		"mp":150,
		"atk":15,
		"def":18,
		"speed":15
	}
	]
	
	skillList=[Skill_GodPower.new()]