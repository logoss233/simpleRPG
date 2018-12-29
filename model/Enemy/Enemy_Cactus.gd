extends Enemy
class_name Enemy_Cactus

func _init():
	mingzi="仙人掌拳击手"
	img=load("res://image/cactus.png")
	hp=1500
	mp=40
	atk=80
	def=50
	speed=110
	skillList=[TmpSkill.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=0
		mingzi="尖刺"
		description="受到普通攻击时反弹25%伤害"
		
		var trigger=TmpTrigger.new()
		triggerList.append(trigger)
		
class TmpTrigger extends Trigger:
	func _init():
		event="damage_after"
	func condition(dmgObj:DmgObj):
		if dmgObj.to==character && dmgObj.isNormalAttack &&dmgObj.rebound:
			return true
		else:
			return false
	func action(dmgObj:DmgObj):
		var dmgObj2=DmgObjFactory.createMagicDmg(dmgObj.to,dmgObj.from,floor(dmgObj.dmg*0.25))
		BattleProcess.damageProcess(dmgObj2)