extends Skill

func _init():
	mingzi="神之力量"
	description="增加所有属性,持续10秒"
	cost=20
	cd=50
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="神之力量"
	buff.life=7
	buff.property={
		"atk":1000
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)