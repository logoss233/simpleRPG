extends Item
class_name Item_LifeCloak

func _init():
	type=0
	mingzi="生命斗篷"
	property={
		"hp":200
	}
	triggerList=[TmpTrigger.new()]
	description="""最大生命值+200
	每3秒回复最大生命值2%的生命
"""
	
	
	
class TmpTrigger extends Trigger:
	var timer=0
	func _init():
		event="process"
	func condition(delta):
		return true
	func action(delta):
		timer+=delta
		if timer>3:
			var healObj=HealObjFactory.createHeal(character,character,floor(character.hp_max/50))
			Battle.heatProcess(healObj)
			timer=0