#更改受到的治疗效果
extends Trigger
class_name Trigger_HealChange

var changeRate=10

func _init():
	event="heal_before"
func condition(healObj:HealObj):
	if healObj.to==character:
		return true
	else:
		return false
func action(healObj:HealObj):
	healObj.heal=floor(healObj.heal*(1+float(changeRate)/100))