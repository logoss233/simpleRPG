extends Skill
class_name Skill_Crit

func _init():
	type=0
	mingzi="致命一击"
	description="被动：50%概率造成2倍伤害"
	var trigger=Trigger_Crit.new()
	triggerList.append(trigger)

