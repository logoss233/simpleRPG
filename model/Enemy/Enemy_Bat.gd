extends Enemy
class_name Enemy_Bat

func _init():
	mingzi="吸血蝙蝠"
	img=load("res://image/bat.png")
	hp=900
	mp=60
	atk=80
	def=60
	speed=160
	skillList=[TmpSkill.new(),TmpSkill2.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=0
		mingzi="吸血"
		description="攻击吸血25%"
		
		var trigger=Trigger_LifeSteal.new()
		trigger.stealRate=25
		triggerList.append(trigger)

class TmpSkill2 extends SimpleSkill:
	func _init():
		type=0
		mingzi="闪避"
		description="25%闪避普通攻击"
		
		var trigger=Trigger_Dodge.new()
		trigger.dodgeRate=25
		triggerList.append(trigger)