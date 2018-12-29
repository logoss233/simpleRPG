extends Role
class_name Role_GreatMage

func _init():
	mingzi="奥尔" #名字
	title="大法师" #称号
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
	
	skillList=[Skill_MagicMaster.new(),TmpSkill.new()]
	
class TmpSkill extends SimpleSkill:
	func _init():
		mingzi="火球术"
		type=1
		description="""造成100点魔法伤害
		cost:50  cd:3
		"""
		cost=50
		cd=3
	func use():
		var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,100)
		BattleProcess.damageProcess(dmgObj)
		