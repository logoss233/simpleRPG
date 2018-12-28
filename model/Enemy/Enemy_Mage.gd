extends Enemy
class_name Enemy_Mage

func _init():
	mingzi="黑暗法师"
	img=load("res://image/mage.png")
	hp=700
	mp=200
	atk=40
	def=30
	speed=70
	skillList=[TmpSkill.new(),TmpSkill2.new()]
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=1
		mingzi="暗影箭"
		description="造成300点伤害"
		cost=60
		cd=7
	func use():
		var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,300)
		BattleProcess.damageProcess(dmgObj)

class TmpSkill2 extends SimpleSkill:
	func _init():
		type=1
		mingzi="黑暗屏障"
		description="获得300的护盾"
		cost=40
		cd=10
	func use():
		owner.shield+=300