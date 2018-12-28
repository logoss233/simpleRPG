extends Enemy
class_name Enemy_StoneMan

func _init():
	mingzi="岩石傀儡"
	img=load("res://image/stoneMan.png")
	hp=2200
	mp=220
	atk=180
	def=220
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

