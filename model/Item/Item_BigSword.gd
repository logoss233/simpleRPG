extends Item
class_name Item_BigSword

func _init():
	type=0
	mingzi="大剑"
	property={
		"atk":20,
		"def":10,
		"speed":-15
	}
	triggerList=[]
	description="""很大的剑，威力很大，也能防御，但是会降低速度
atk:20,
def:10,
speed:-15
"""
	