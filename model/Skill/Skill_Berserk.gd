extends Skill
class_name Skill_Berserker

func _init():
	type=1 #主动技能
	mingzi="狂战士"
	descriptionList=["""cost:10 cd:15
攻击+20，
防御-15，
速度+20,
持续5秒
""",
"""cost:10 cd:13
攻击+30，
防御-20，
速度+30，
持续8秒
""",
"""cost:10 cd:11
攻击+40，
防御-25，
速度+40,
持续10秒
"""
	]
	costList=[10,10,10]
	cdList=[15,13,11]
	
	
	
func use():
	#生成一个持续10秒的buff加到使用者身上
	var buff=Buff.new()
	buff.mingzi="狂战士lv"+String(lv)
	match lv:
		0:
			buff.life=5
			buff.property={
			"atk":20,
			"def":-15,
			"speed":20
	}
		1:
			buff.life=8
			buff.property={
			"atk":30,
			"def":-20,
			"speed":30
	}
		2:
			buff.life=10
			buff.property={
			"atk":40,
			"def":-25,
			"speed":40
	}
	
	buff.description=self.description
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)