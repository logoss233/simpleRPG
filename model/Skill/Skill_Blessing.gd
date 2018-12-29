extends Skill
class_name Skill_Blessing

func _init():
	type=0
	mingzi="祝福"
	descriptionList=[
	"受到的治疗效果+10%，并且每3秒回复1.5%生命值",
	"受到的治疗效果+20%，并且每3秒回复3%生命值",
	"受到的治疗效果+30%，并且每3秒回复4.5%生命值",
	]
	
	var trigger=Trigger_HealChange.new()
	trigger.changeRate=10
	triggerListList[0].append(trigger)
	
	trigger=Trigger_HealChange.new()
	trigger.changeRate=20
	triggerListList[1].append(trigger)
	
	trigger=Trigger_HealChange.new()
	trigger.changeRate=30
	triggerListList[2].append(trigger)

	
	trigger=Trigger_PersistHeal.new()
	trigger.interval=3
	trigger.heal_percent=1.5
	triggerListList[0].append(trigger)
	
	trigger=Trigger_PersistHeal.new()
	trigger.interval=3
	trigger.heal_percent=3
	triggerListList[1].append(trigger)
	
	trigger=Trigger_PersistHeal.new()
	trigger.interval=3
	trigger.heal_percent=4.5
	triggerListList[2].append(trigger)