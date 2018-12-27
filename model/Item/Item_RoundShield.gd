extends Item
class_name Item_RoundShield

func _init():
	type=0
	mingzi="小圆盾"
	property={}
	triggerList=[]
	description="""50%概率格挡20点普通攻击伤害
	"""
	var trigger=Trigger_Block.new()
	trigger.blockRate=50
	trigger.reduce=20
	triggerList.append(trigger)
	
func use():
	pass

