extends Skill
class_name Skill_MagicShield

func _init():
	type=0
	mingzi="魔法盾"
	descriptionList=[
	"""
	使用技能后，消耗的魔法值的60%转换为护盾
	""",
	"""
	使用技能后，消耗的魔法值的120%转换为护盾
	""",
	"""
	使用技能后，消耗的魔法值的180%转换为护盾
	""",
	]
	triggerListList=[
	[Trigger_MagicShield.new(60)],
	[Trigger_MagicShield.new(120)],
	[Trigger_MagicShield.new(180)]
	]

