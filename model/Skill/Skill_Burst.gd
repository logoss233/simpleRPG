extends Skill
class_name Skill_Burst

func _init():
	type=1
	mingzi="爆裂"
	descriptionList=[
	"cost:100,cd25\n造成敌人最大生命值7%+300点魔法伤害",
	"cost:150,cd20\n造成敌人最大生命值14%+600点魔法伤害",
	"cost:200,cd15\n造成敌人最大生命值21%+900点魔法伤害"
	]
	costList=[100,150,200]
	cdList=[25,20,15]

func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,floor(owner.oppent.hp_max*0.07*lv+200*lv))
	BattleProcess.damageProcess(dmgObj)
	pass
