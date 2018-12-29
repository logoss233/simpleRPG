extends Skill
class_name Skill_GodPower

func _init():
	type=1
	mingzi="神之力量"
	descriptionList=["""cost:50,cd25
	攻击+50%，这下NB了
	持续7秒
	""",
	"""
	cost:70,cd30
	攻击+100%，这下NB了
	持续7秒
	""",
	"""
	cost:90,cd30
	攻击+150%，这下NB了
	持续
	"""
	]
	cost=50
	cd=30
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="神之力量"
	buff.life=7
	buff.description="攻击+"+String(lv*50)+"%,这下NB了"
	buff.property={
		"atk_percent":lv*50
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)