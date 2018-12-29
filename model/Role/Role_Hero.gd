extends Role
class_name Role_Hero

func _init():
	mingzi="勇者" #名字
	title="勇者" #称号
	description=""
	propertyList=[{
		"hp":80,
		"mp":30,
		"atk":6,
		"def":4,
		"speed":5
	},
	{
		"hp":160,
		"mp":60,
		"atk":12,
		"def":8,
		"speed":10
	},
	{
		"hp":240,
		"mp":90,
		"atk":18,
		"def":12,
		"speed":15
	}
	]
	
	skillList=[Skill_LightGuard.new(),Skill_BalanceAttack.new()]
	
