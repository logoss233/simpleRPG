extends Skill

func _init():
	mingzi="强化"
	description="增加所有属性,持续10秒"
	cost=20
	cd=20
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="强化"
	buff.life=10
	buff.property={
		"atk":1000,
		"def":1000,
		"speed":200,
		"critRate":50,
		"critPower":1
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)