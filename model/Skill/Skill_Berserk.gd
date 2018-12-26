extends Skill

func _init():
	type=1 #主动技能
	mingzi="狂战士"
	description=["""cost:10 cd:20
	攻击+50，
	防御-50，
	速度+50,
	持续5秒
	""",
	"""cost:10 cd:15
	攻击+75，
	防御-75，
	速度+75，
	持续8秒
	""",
	"""cost:10 cd:10
	攻击+100，
	防御-100，
	速度+100,
	持续10秒
	"""
	]
	costList=[10,10,10]
	cdList=[20,15,10]
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="狂战士lv"+String(lv)
	match lv:
		0:
			buff.life=5
			buff.property={
			"atk":50,
			"def":-50,
			"speed":50
	}
		1:
			buff.life=8
			buff.property={
			"atk":75,
			"def":-75,
			"speed":75
	}
		2:
			buff.life=10
			buff.property={
			"atk":100,
			"def":-100,
			"speed":100
	}
	
	buff.description=self.description
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)