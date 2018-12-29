#使用技能后 消耗的魔法值转换为护盾
extends Trigger
class_name Trigger_MagicShield

var rate=100

func _init(rate=100):
	event="skill_after"
	self.rate=rate
func condition(skillObj):
	if skillObj.user==character:
		return true
	else:
		return false
func action(skillObj):
	skillObj.user.shield+=floor(skillObj.skill.cost*float(rate)/100)