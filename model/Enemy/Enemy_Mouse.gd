extends Enemy
class_name Enemy_Mouse

func _init():
	mingzi="魔化鼠"
	img=load("res://image/mouse.png")
	hp=700
	mp=60
	atk=60
	def=35
	speed=150
	skillList=[TmpSkill.new(),Skill_Berserker.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=0
		mingzi="致命一击"
		description="20%概率造成1.75倍伤害"
		
		var trigger=Trigger_Crit.new()
		trigger.critRate=20
		trigger.critPower=1.75
		triggerList.append(trigger)