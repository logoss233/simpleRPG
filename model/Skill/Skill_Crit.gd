extends Skill
class_name Skill_Crit

func _init():
	type=0
	mingzi="致命一击"
	descriptionList=[
	"15%造成1.5倍伤害",
	"20%造成1.75倍伤害",
	"25%造成2倍伤害"
	]
	
	var trigger=Trigger_Crit.new()
	trigger.critRate=15
	trigger.critPower=1.5
	triggerListList[0].append(trigger)
	
	trigger=Trigger_Crit.new()
	trigger.critRate=20
	trigger.critPower=1.75
	triggerListList[1].append(trigger)
	
	trigger=Trigger_Crit.new()
	trigger.critRate=25
	trigger.critPower=2
	triggerListList[2].append(trigger)
	

