extends Role
class_name Role_Valkrie

func _init():
	mingzi="瓦尔基" #名字
	title="女武神" #称号
	description=""
	propertyList=[{
		"hp":80,
		"mp":50,
		"atk":5,
		"def":6,
		"speed":5
	},
	{
		"hp":160,
		"mp":100,
		"atk":10,
		"def":12,
		"speed":10
	},
	{
		"hp":240,
		"mp":150,
		"atk":15,
		"def":18,
		"speed":15
	}
	]
	
	skillList=[Skill_WakenessAttack.new()]