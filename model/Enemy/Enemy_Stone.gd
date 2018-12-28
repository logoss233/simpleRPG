extends Enemy
class_name Enemy_Stone

func _init():
	mingzi="石像"
	img=load("res://image/stone.png")
	hp=2100
	mp=300
	atk=190
	def=220
	speed=100
	skillList=[TmpSkill.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=1
		mingzi="神秘射线"
		description="""造成700点伤害，
		攻击-20%
		防御-20%
		速度-20%
		持续15秒
		"""
		cd=15
	func use():
		var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,700)
		var buff=Buff.new()
		buff.mingzi="神秘射线"
		buff.life=15
		buff.description="""攻击-20%
		防御-20%
		速度-20%
		"""
		buff.property={
			"atk_percent":-20,
			"def_percent":-20,
			"speed_percent":-20
		}
		owner.oppent.buff_append(buff)
		pass

