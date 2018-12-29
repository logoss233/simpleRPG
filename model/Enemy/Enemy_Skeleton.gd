extends Enemy
class_name Enemy_Skeleton

func _init():
	mingzi="骷髅战士"
	img=load("res://image/skeleton.png")
	hp=2200
	mp=60
	atk=130
	def=100
	speed=170
	skillList=[TmpSkill.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=0
		mingzi="盾牌格挡"
		description="66%概率格挡66点普通攻击伤害"
		
		var trigger=Trigger_Block.new()
		trigger.blockRate=66
		trigger.reduce=66
		triggerList.append(trigger)