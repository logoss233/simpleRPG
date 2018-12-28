extends Skill
class_name Skill_BalanceAttack

func _init():
	type=1 #主动技能
	mingzi="平衡打击"
	descriptionList=["""cost:20 cd:10
造成50点魔法伤害，获得50点护盾
""",
"""cost:25 cd:10
造成100点魔法伤害，获得100点护盾
""",
"""cost:30 cd:10
造成150点魔法伤害，获得150点护盾
"""
	]
	costList=[20,25,30]
	cdList=[10,10,10]
	
	
	
func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,lv*50)
	BattleProcess.damageProcess(dmgObj)
	owner.shield+=lv*50