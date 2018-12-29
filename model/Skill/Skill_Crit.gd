extends Skill
class_name Skill_Crit

func _init():
	type=0
	mingzi="致命一击"
	descriptionList=[
	"10%造成2倍伤害",
	"20%造成2倍伤害",
	"30%造成2倍伤害"
	]
	
	var trigger=Trigger_Crit.new()
	trigger.critRate=10
	trigger.critPower=2
	triggerListList[0].append(trigger)
	
	trigger=Trigger_Crit.new()
	trigger.critRate=20
	trigger.critPower=2
	triggerListList[1].append(trigger)
	
	trigger=Trigger_Crit.new()
	trigger.critRate=30
	trigger.critPower=2
	triggerListList[2].append(trigger)
	

