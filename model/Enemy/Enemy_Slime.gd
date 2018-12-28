extends Enemy
class_name Enemy_Slime

func _init():
	mingzi="史莱姆"
	img=load("res://image/enemy.png")
	hp=500
	mp=100
	atk=40
	def=30
	speed=110
	skillList=[]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=0
		mingzi="腐蚀"
		description="""普通攻击减少对方10点防御
		最多叠加5层
		"""
		
#		var trigger=Trigger_Crit.new()
#		trigger.critRate=20
#		trigger.critPower=1.75
#		triggerList.append(trigger)


class TmpTrigger extends Trigger:
	var blockRate=50
	var reduce=20
	
	func _init():
		event="damage_after"
	func condition(dmgObj:DmgObj):
		if dmgObj.from==character && dmgObj.isNormalAttack:
			return true
		else:
			return false
	func action(dmgObj:DmgObj):
		#给对手加减护甲buff
		var buff=Buff.new()
		buff.mingzi="腐蚀"
		buff.description="每层减少10点护甲"
		buff.addType="increase"
		buff.life=99
		buff.property={
			"def":-10
		}
		

class TmpBuff extends Buff:
	_init():
		buff.mingzi="腐蚀"
		buff.description="每层减少10点护甲"
		buff.addType="increase"
		buff.life=99
		buff.property={
			"def":-10
		}