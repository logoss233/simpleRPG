extends Trigger
class_name Trigger_Crit

var critRate=50
var critPower=2

func _init():
	event="crit"
func condition(dmgObj:DmgObj):
	if dmgObj.canCrit && dmgObj.from==character:
		return true
	else:
		return false

func action(dmgObj:DmgObj):
	#判断是否暴击
	if randf()<float(critRate)/100:
		#是否已经是暴击伤害
		if dmgObj.isCrit:
			#如果这个暴击更强，覆盖原来的暴击
			if critPower>dmgObj.critPower:
				dmgObj.critPower=critPower
				dmgObj.dmg=floor(dmgObj.critBaseDmg*critPower)
		else:
			dmgObj.isCrit=true
			dmgObj.critBaseDmg=dmgObj.dmg
			dmgObj.critPower=critPower
			dmgObj.dmg=dmgObj.dmg*critPower
	
	