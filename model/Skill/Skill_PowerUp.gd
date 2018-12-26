extends Skill

func _init():
	type=1
	mingzi="强化"
	description="""cost:20,cd20
	增加所有属性100,持续10秒
	"""
	cost=20
	cd=20
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="强化"
	buff.life=10
	buff.description="""cost:20,cd20
	增加所有属性100,持续10秒
	"""
	buff.property={
		"atk":100,
		"def":100,
		"speed":100
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)