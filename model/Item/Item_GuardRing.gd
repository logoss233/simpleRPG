extends Item
class_name Item_GuardRing

func _init():
	type=0
	mingzi="守护之戒"
	property={
		"def":15
	}
	triggerList=[TmpTrigger.new()]
	description="""防御+15
进入战斗时，获得150点护盾
"""
	
	
class TmpTrigger extends Trigger:
	
	func _init():
		event="battle_start"
	func condition(dmgObj:DmgObj):
		return true
	func action(dmgObj:DmgObj):
		character.shield+=150