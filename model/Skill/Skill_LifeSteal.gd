extends Skill
class_name Skill_LifeSteal

func _init():
	type=0
	mingzi="生命偷取"
	descriptionList=[
	"10%攻击吸血",
	"20%攻击吸血",
	"30%攻击吸血"
	]
	
	var trigger=Trigger_LifeSteal.new()
	trigger.stealRate=10
	triggerListList[0].append(trigger)
	
	trigger=Trigger_LifeSteal.new()
	trigger.stealRate=20
	triggerListList[1].append(trigger)
	
	trigger=Trigger_LifeSteal.new()
	trigger.stealRate=30
	triggerListList[2].append(trigger)


	
	