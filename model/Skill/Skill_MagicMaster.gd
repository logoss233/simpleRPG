extends Skill
class_name Skill_MagicMaster

func _init():
	type=0
	mingzi="法术精通"
	descriptionList=[
	"造成的魔法伤害增加10%",
	"造成的魔法伤害增加20%",
	"造成的魔法伤害增加30%"
	]
	
	var trigger=Trigger_MagicPowerUp.new()
	trigger.rate=10
	triggerListList[0].append(trigger)
	
	trigger=Trigger_MagicPowerUp.new()
	trigger.rate=20
	triggerListList[1].append(trigger)
	
	trigger=Trigger_MagicPowerUp.new()
	trigger.rate=30
	triggerListList[2].append(trigger)
