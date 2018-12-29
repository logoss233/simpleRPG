extends Skill
class_name Skill_AntiMagic

func _init():
	type=0
	mingzi="魔法抵抗"
	descriptionList=[
	"受到的魔法伤害减少12%",
	"受到的魔法伤害减少24%",
	"受到的魔法伤害减少36%"
	]
	var trigger=Trigger_MagicDamageReduce.new()
	trigger.reduceRate=12
	triggerListList[0].append(trigger)
	
	trigger=Trigger_MagicDamageReduce.new()
	trigger.reduceRate=24
	triggerListList[1].append(trigger)
	
	trigger=Trigger_MagicDamageReduce.new()
	trigger.reduceRate=36
	triggerListList[2].append(trigger)
	