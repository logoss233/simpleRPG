extends Role
class_name Role_Hero

func _init():
	mingzi="卡卡罗特" #名字
	lv=1 #等级 最多3级
	title="勇者" #称号
	description=""
	propertyList=[{
		"hp":100,
		"mp":30,
		"atk":20,
		"def":12,
		"speed":80
	},
	{
		"hp":120,
		"mp":40,
		"atk":30,
		"def":18,
		"speed":100
	},
	{
		"hp":140,
		"mp":50,
		"atk":40,
		"def":24,
		"speed":120
	}
	]
	
	var skill=load("res://model/Skill/Skill_Crit.gd").new()
	skillList.append(skill)