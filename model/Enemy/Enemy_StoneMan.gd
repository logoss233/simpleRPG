extends Enemy
class_name Enemy_StoneMan

func _init():
	mingzi="岩石傀儡"
	img=load("res://image/stoneMan.png")
	hp=3800
	mp=200
	atk=244
	def=240
	speed=150
	

	
	
	skillList=[TmpSkill.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=0
		mingzi="抗魔"
		description="""受到的魔法伤害减少50%"""
		var trigger=Trigger_MagicDamageReduce.new()
		trigger.reduceRate=50
		triggerList.append(trigger)

