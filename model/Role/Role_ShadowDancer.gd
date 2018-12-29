extends Role
class_name Role_ShadowDancer

func _init():
	mingzi="凯琳" #名字
	title="影舞者" #称号
	description=""
	propertyList=[{
		"hp":60,
		"mp":10,
		"atk":5,
		"def":5,
		"speed":7
	},
	{
		"hp":120,
		"mp":20,
		"atk":10,
		"def":10,
		"speed":14
	},
	{
		"hp":180,
		"mp":30,
		"atk":15,
		"def":15,
		"speed":21
	}
	]
	
	skillList=[Skill_Dodge.new()]