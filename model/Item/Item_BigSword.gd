extends Item
class_name Item_BigSword

func _init():
	type=0
	mingzi="大剑"
	property={
		"atk":200,
		"def":100,
		"speed":-100
	}
	triggerList=[]
	description="很大的剑，威力很大，也能格挡，但是会降低速度"
	