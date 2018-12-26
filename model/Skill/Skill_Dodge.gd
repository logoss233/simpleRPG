extends Skill

func _init():
	type=0
	mingzi="闪避"
	description="被动：50%闪避敌人的攻击"
	var trigger=Trigger_Dodge.new()
	triggerList.append(trigger)

