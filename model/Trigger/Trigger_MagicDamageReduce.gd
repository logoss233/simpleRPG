#受到魔法伤害减少
extends Trigger
class_name Trigger_MagicDamageReduce

var reduceRate=70

func _init():
	event="damage_before"
func condition(dmgObj:DmgObj):
	if dmgObj.to==character && dmgObj.type==1:
		return true
	else:
		return false
func action(dmgObj:DmgObj):
	dmgObj.dmg=floor(dmgObj.dmg*(1-float(reduceRate)/100))