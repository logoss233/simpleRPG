extends Skill

func _init():
	type=1
	mingzi="死亡一指"
	descriptionList=[
	"cost:50,cd100\n造成5000点魔法伤害",
	"cost:60,cd60\n造成7500点魔法伤害",
	"cost:70,cd30\n造成10000点魔法伤害"
	]
	costList=[50,60,70]
	cdList=[100,60,30]

func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,5000+(lv-1)*2500)
	Battle.damageProcess(dmgObj)
	pass
