extends Skill

func _init():
	type=1
	mingzi="神之力量"
	description="""cost:20,cd50
	攻击+1000，这下NB了
	"""
	cost=20
	cd=50
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="神之力量"
	buff.life=7
	buff.description="""
	攻击+1000，这下NB了
	"""
	buff.property={
		"atk":1000
	}
	buff.isShow=true
	buff.addType="single"
	var trigger=Trigger_Crit.new()
	buff.triggerList.append(trigger)
	owner.buff_append(buff)