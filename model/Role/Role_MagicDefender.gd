extends Role
class_name Role_MagicDefender

func _init():
	mingzi="卡伦" #名字
	title="魔法防御者" #称号
	description=""
	propertyList=[{
		"hp":60,
		"mp":60,
		"atk":4,
		"def":6,
		"speed":5
	},
	{
		"hp":120,
		"mp":120,
		"atk":8,
		"def":12,
		"speed":10
	},
	{
		"hp":180,
		"mp":180,
		"atk":12,
		"def":18,
		"speed":15
	}
	]
	
	skillList=[Skill_MagicShield.new(),TmpSKill.new()]
	
	
class TmpSKill extends SimpleSkill:
	func _init():
		type=1
		mingzi="护盾防御"
		description="""
		获得100点护盾
		cost:80 cd:10
		"""
		cost=80
		cd=10
	func use():
		owner.shield+=100