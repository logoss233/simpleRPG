extends Enemy
class_name Enemy_Smoke

func _init():
	mingzi="暗影迷雾"
	img=load("res://image/smoke.png")
	hp=2000
	mp=400
	atk=150
	def=65
	speed=130
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
		description="""攻击-13
		防御-13
		持续20秒
		cd:3 cost:50
		"""
		cd=3
		cost=50
	func use():
		var buff=Buff.new()
		buff.mingzi="诅咒"
		buff.description="""攻击-13
		防御-13
		"""
		buff.addType="single"
		buff.life=17
		buff.property={
			"atk":-13,
			"def":-13
		}
		owner.oppent.buff_append(buff)