extends Node

#快速生成普通攻击的伤害
static func createAttackDmg(from,to,dmg):
	var dmgObj=DmgObj.new({
		"from":from,
		"to":to,
		"dmg":dmg,
		"canCrit":true,
		"type":0,
		"rebound":true,
		"canDodge":true
		})
	return dmgObj
#快速生成魔法攻击的伤害
static func createMagicDmg(from,to,dmg):
	var dmgObj=DmgObj.new({
		"from":from,
		"to":to,
		"dmg":dmg,
		"canCrit":false,
		"type":1,
		"rebound":true,
		"canDodge":false
		})
	return dmgObj

