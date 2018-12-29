extends Skill
class_name Skill_WakenessAttack

func _init():
	type=1
	mingzi="弱点打击"
	descriptionList=["""cost:50,cd:12
	造成100点伤害，减少敌人10%防御
	持续7秒
	""",
	"""
	cost:60,cd:11
	造成200点伤害，减少敌人20%防御
	持续8秒
	""",
	"""
	cost:70,cd10
	造成300点伤害，减少敌人30%防御
	持续9秒
	"""
	]
	costList=[50,60,70]
	cdList=[12,11,10]
	
	
	
func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,100*lv)
	BattleProcess.damageProcess(dmgObj)

	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="弱点打击"
	buff.life=6+lv
	buff.description="防御-"+String(lv*10)+"%"
	buff.property={
		"def_percent":-lv*10
	}
	buff.isShow=true
	buff.addType="single"
	owner.oppent.buff_append(buff)