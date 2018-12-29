extends Enemy
class_name Enemy_TreeMan

func _init():
	mingzi="树精"
	img=load("res://image/treeMan.png")
	hp=2500
	mp=350
	atk=200
	def=100
	speed=100
	
	skillList=[TmpSkill.new()]
	
	

class TmpSkill extends SimpleSkill:
	func _init():
		type=1
		mingzi="缠绕"
		description="""减少对手50点速度，每秒造成50点伤害，持续5秒
		cd:10  cost:50
		"""
		cost=50
		cd=10
		
	func use():
		var buff=Buff.new()
		buff.mingzi="缠绕"
		buff.description="减少50点速度，每秒造成50点伤害"
		buff.addType="single"
		buff.life=5
		buff.property={
			"speed":-50
		}
		buff.triggerList=[TmpTrigger.new()]
		owner.oppent.buff_append(buff)

class TmpTrigger extends Trigger:
	var timer=1
	func _init():
		event="process"
	func condition(delta):
		return true
	func action(delta):
		timer-=delta
		if timer<=0:
			var dmgObj=DmgObjFactory.createMagicDmg(character.oppent,character,50)
			BattleProcess.damageProcess(dmgObj)
			timer=1