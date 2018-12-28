extends Role
class_name Role_Berserker

func _init():
	mingzi="巴斯卡" #名字
	title="狂战士" #称号
	description=""
	propertyList=[{
		"hp":100,
		"mp":10,
		"atk":8,
		"def":0,
		"speed":5
	},
	{
		"hp":200,
		"mp":10,
		"atk":16,
		"def":0,
		"speed":8
	},
	{
		"hp":300,
		"mp":10,
		"atk":24,
		"def":0,
		"speed":10
	}
	]
	
	var skill=load("res://model/Skill/Skill_Berserk.gd").new()
	skillList.append(skill)