#造成的魔法伤害增加
extends Trigger
class_name Trigger_MagicPowerUp

var rate=10

func _init():
	event="damage_before"
func condition(dmgObj:DmgObj):
	if dmgObj.from==character && dmgObj.type==1:
		return true
	else:
		return false
func action(dmgObj:DmgObj):
	dmgObj.dmg=floor(dmgObj.dmg*(1+float(rate)/100))