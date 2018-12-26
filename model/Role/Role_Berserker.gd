extends Role
class_name Role_Berserker

func _init():
	mingzi="巴斯卡" #名字
	title="狂战士" #称号
	description=""
	propertyList=[{
		"hp":60,
		"mp":10,
		"atk":20,
		"def":0,
		"speed":20
	},
	{
		"hp":120,
		"mp":10,
		"atk":40,
		"def":0,
		"speed":30
	},
	{
		"hp":180,
		"mp":10,
		"atk":60,
		"def":0,
		"speed":40
	}
	]
	
	var skill=load("res://model/Skill/Skill_Berserk.gd").new()
	skillList.append(skill)