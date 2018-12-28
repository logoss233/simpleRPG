extends Item
class_name Item_DeddyDagger

func _init():
	type=0
	mingzi="致命匕首"
	property={
		"atk":15,
		"speed":15
	}
	triggerList=[]
	description="""攻击+15
	速度+15
	普通攻击15%概率造成2倍伤害
"""
	var trigger=Trigger_Crit.new()
	trigger.critPower=2
	trigger.critRate=15
	triggerList.append(trigger)