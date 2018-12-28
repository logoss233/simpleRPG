#普通攻击吸血
extends Trigger
class_name Trigger_LifeSteal

var stealRate=20

func _init():
	event="damage_after"
func condition(dmgObj:DmgObj):
	if dmgObj.from==character && dmgObj.isNormalAttack:
		return true
	else:
		return false
func action(dmgObj:DmgObj):
	var healObj=HealObjFactory.createHeal(character,character,floor(float(stealRate)/100*dmgObj.dmg))
	BattleProcess.healProcess(healObj)