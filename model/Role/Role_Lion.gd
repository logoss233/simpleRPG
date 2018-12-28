extends Role
class_name Role_Lion

func _init():
	mingzi="莱恩" #名字
	lv=1 #等级 最多3级
	title="恶魔巫师" #称号
	description=""
	propertyList=[{
		"hp":30,
		"mp":60,
		"atk":3,
		"def":2,
		"speed":2
	},
	{
		"hp":60,
		"mp":90,
		"atk":6,
		"def":4,
		"speed":5
	},
	{
		"hp":90,
		"mp":120,
		"atk":30,
		"def":9,
		"speed":7
	}
	]
	
	var skill=Skill_DeathFinger.new()
	skillList.append(skill)