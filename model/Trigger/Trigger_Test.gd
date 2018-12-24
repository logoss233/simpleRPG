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
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.property={
		"atk":-100
		}
	var player=eventArg as BattleCharacter
	target.buff_append(buff)
	pass