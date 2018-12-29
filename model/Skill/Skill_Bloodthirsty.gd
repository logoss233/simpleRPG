extends Skill
class_name Skill_Bloodthirsty

func _init():
	type=1
	mingzi="嗜血"
	descriptionList=["""cost:50,cd:25
	速度+30
	持续8秒
	""",
	"""cost:75,cd:25
	速度+60
	持续10秒
	""",
	"""cost:100,cd:25
	速度+90
	持续12秒
	"""
	]
	costList=[50,75,100]
	cdList=[25,25,25]
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="嗜血"
	buff.life=6+2*lv
	buff.description="速度+"+String(lv*30)
	buff.property={
		"speed":lv*30
	}
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)