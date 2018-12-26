extends Role
class_name Role_Lion

func _init():
	mingzi="莱恩" #名字
	lv=1 #等级 最多3级
	title="恶魔巫师" #称号
	description=""
	propertyList=[{
		"hp":30,
		"mp":40,
		"atk":10,
		"def":6,
		"speed":10
	},
	{
		"hp":60,
		"mp":70,
		"atk":20,
		"def":12,
		"speed":10
	},
	{
		"hp":90,
		"mp":100,
		"atk":30,
		"def":16,
		"speed":10
	}
	]
	
	var skill=load("res://model/Skill/Skill_DeathFinger.gd").new()
	skillList.append(skill)