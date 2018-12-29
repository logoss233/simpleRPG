#持续治疗
extends Trigger
class_name Trigger_PersistHeal

var heal=0
var heal_percent=0
var interval=3

var timer=0

func _init():
	event="process"
func condition(delta):
	return true
func action(delta):
	timer+=delta
	if timer>=interval:
		timer=0
		var healObj=HealObjFactory.createHeal(character,character,
		heal+floor(character.hp_max*heal_percent/100))
		BattleProcess.healProcess(healObj)