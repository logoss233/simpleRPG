extends Enemy
class_name Enemy_Rider

func _init():
	mingzi="死亡骑士"
	img=load("res://image/rider.png")
	hp=5600
	mp=350
	atk=330
	def=330
	speed=210
	
	
	skillList=[TmpSkill.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=1
		mingzi="冲锋"
		description="""获得666点护盾，造成666点伤害
		速度+50,持续5秒
		cd:15  cost:66"""
		cd=15
		cost=66
	func use():
		owner.shield+=666
		var dmgObj=DmgObjFactory.createMagicDmg(owner,owner,666)
		BattleProcess.damageProcess(dmgObj)
		var buff=Buff.new()
		buff.mingzi="冲锋"
		buff.life=5
		buff.property={"speed":50}
		owner.buff_append(buff)
