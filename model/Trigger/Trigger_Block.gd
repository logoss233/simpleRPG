#格挡 普通攻击
extends Trigger
class_name Trigger_Block

var blockRate=50
var reduce=20

func _init():
	event="damage_before"
func condition(dmgObj:DmgObj):
	if dmgObj.to==character &&dmgObj.isNormalAttack:
		return true
	else:
		return false
func action(dmgObj:DmgObj):
	if randf()<float(blockRate)/100:
		dmgObj.dmg-=reduce
		if dmgObj.dmg<0:
			dmgObj.dmg=0