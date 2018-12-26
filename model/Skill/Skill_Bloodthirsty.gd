extends Skill

func _init():
	type=1
	mingzi="嗜血"
	description="""cost:5,cd:25
	速度+200
	"""
	cost=5
	cd=25
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="嗜血"
	buff.life=12
	buff.description="""cost:5,cd:25
	速度+200
	"""
	buff.property={
		"speed":200
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)