extends Skill

func _init():
	mingzi="狂战士"
	description="增加所有属性,持续10秒"
	cost=15
	cd=10
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="狂战士"
	buff.life=8
	buff.property={
		"atk":500,
		"def":-500,
		"speed":200,
		"critRate":10,
		"critPower":0.5
		
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)