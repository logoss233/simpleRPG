extends Trigger


func _init():
	event="attack"
	
func condition(eventArg):
	if eventArg==target:
		return true
	else:
		return false
	pass
func action(eventArg):
	#每次攻击减少100攻击力
	#print("owner:",owner.mingzi)
	owner.increase_property("atk",-100)
	pass