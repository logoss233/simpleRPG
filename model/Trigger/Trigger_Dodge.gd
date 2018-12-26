#闪避触发器
extends Trigger
class_name Trigger_Dodge

var dodgeRate=50

func _init():
	event="dodge"
func condition(dmgObj:DmgObj):
	if dmgObj.canDodge && !dmgObj.isDodge && dmgObj.to==character:
		return true
	else:
		return false
func action(dmgObj:DmgObj):
	if randf()<float(dodgeRate)/100:
		dmgObj.isDodge=true
	pass