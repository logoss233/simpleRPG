extends Skill
class_name Skill_DeathFinger

func _init():
	type=1
	mingzi="死亡一指"
	descriptionList=[
	"cost:60,cd25\n造成300点魔法伤害",
	"cost:70,cd20\n造成600点魔法伤害",
	"cost:80,cd15\n造成900点魔法伤害"
	]
	costList=[60,70,80]
	cdList=[25,20,15]

func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,300+(lv-1)*300)
	Battle.damageProcess(dmgObj)
	pass
