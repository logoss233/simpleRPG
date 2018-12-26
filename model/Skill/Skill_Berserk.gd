extends Skill

func _init():
	type=1 #主动技能
	mingzi="狂战士"
	description="""cost:15 cd:10
	攻击+500，
	防御-500，
	速度+200
	"""
	cost=15
	cd=10
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="狂战士"
	buff.life=8
	buff.description="""cost:15 cd:10
	攻击+500，
	防御-500，
	速度+200
	"""
	buff.property={
		"atk":500,
		"def":-500,
		"speed":200
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)