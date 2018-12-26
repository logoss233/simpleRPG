extends Skill

func _init():
	type=1
	mingzi="死亡一指"
	description="""cost:70,cd60
	对敌人造成10000点魔法伤害
	"""
	cost=70
	cd=60

func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,10000)
	Battle.damageProcess(dmgObj)
	pass
