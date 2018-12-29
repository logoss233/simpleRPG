extends Skill
class_name Skill_Dodge

func _init():
	type=0
	mingzi="闪避"
	descriptionList=[
	"10%闪避攻击",
	"20%闪避攻击",
	"30%闪避攻击"
	]
	var trigger=Trigger_Dodge.new()
	trigger.dodgeRate=10
	triggerListList[0].append(trigger)

	trigger=Trigger_Dodge.new()
	trigger.dodgeRate=20
	triggerListList[1].append(trigger)
	
	trigger=Trigger_Dodge.new()
	trigger.dodgeRate=30
	triggerListList[2].append(trigger)
	
	