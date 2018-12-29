extends Item
class_name Item_RoundShield

func _init():
	type=0
	mingzi="小圆盾"
	property={}
	triggerList=[]
	description="""65%概率格挡50点普通攻击伤害
	"""
	var trigger=Trigger_Block.new()
	trigger.blockRate=65
	trigger.reduce=50
	triggerList.append(trigger)
	
func use():
	pass

