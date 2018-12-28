extends Enemy
class_name Enemy_Smoke

func _init():
	mingzi="暗影迷雾"
	img=load("res://image/smoke.png")
	hp=1800
	mp=250
	atk=130
	def=80
	speed=140
	skillList=[TmpSkill.new(),TmpSkill2.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=0
		mingzi="迷雾"
		description="50%概率闪避普通攻击"
		
		var trigger=Trigger_Dodge.new()
		trigger.dodgeRate=50
		triggerList.append(trigger)
		
class TmpSkill2 extends SimpleSkill:
	func _init():
		type=1
		mingzi="诅咒"
		description="""攻击-20
		防御-20
		持续20秒
		"""
		cd=3
		cost=50
	func use():
		var buff=Buff.new()
		buff.mingzi="诅咒"
		buff.description="""攻击-20
		防御-20
		"""
		buff.addType="single"
		buff.life=20
		buff.property={
			"atk":-20,
			"def":-20
		}
		owner.oppent.buff_append(buff)