extends Enemy
class_name Enemy_FlyFish

func _init():
	mingzi="魔鬼巨鲸"
	img=load("res://image/flyFish.png")
	hp=2200
	mp=300
	atk=200
	def=150
	speed=140
	skillList=[TmpSkill.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=1
		mingzi="吞噬"
		description="""造成400点伤害，回复400点生命"""
		cd=10
		cost=100
	func use():
		var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,400)
		BattleProcess.damageProcess(dmgObj)
		var healObj=HealObjFactory.createHeal(owner,owner,400)
		BattleProcess.healProcess(healObj)
		