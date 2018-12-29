extends Role
class_name Role_VampirePrinecess

func _init():
	mingzi="雪莉" #名字
	title="吸血鬼公主" #称号
	description=""
	propertyList=[{
		"hp":70,
		"mp":30,
		"atk":5,
		"def":6,
		"speed":5
	},
	{
		"hp":140,
		"mp":60,
		"atk":10,
		"def":12,
		"speed":10
	},
	{
		"hp":210,
		"mp":90,
		"atk":15,
		"def":18,
		"speed":15
	}
	]
	
	skillList=[Skill_LifeSteal.new()]