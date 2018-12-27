extends Item
class_name Item_LightTrunch

func _init():
	type=1
	mingzi="闪电权杖"
	property={"mp":100}
	triggerList=[]
	description="""魔法最大值+100
	使用：发出一道闪电攻击敌人，造成200点魔法伤害
	cd:60  cost:20
	"""
	cost=20
	cd=60
	
func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,200)
	Battle.damageProcess(dmgObj)
	pass