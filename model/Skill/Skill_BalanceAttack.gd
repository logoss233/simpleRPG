extends Skill
class_name Skill_BalanceAttack

func _init():
	type=1 #主动技能
	mingzi="平衡打击"
	descriptionList=["""cost:20 cd:10
造成75点魔法伤害，获得75点护盾
""",
"""cost:25 cd:10
造成150点魔法伤害，获得150点护盾
""",
"""cost:30 cd:10
造成225点魔法伤害，获得225点护盾
"""
	]
	costList=[20,25,30]
	cdList=[10,10,10]
	
	
	
func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,lv*75)
	BattleProcess.damageProcess(dmgObj)
	owner.shield+=lv*75