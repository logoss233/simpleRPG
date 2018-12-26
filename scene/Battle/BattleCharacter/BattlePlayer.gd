extends BattleCharacter
class_name BattlePlayer

var number=1 #一共有几个人


func _ready():
	
	pass # Replace with function body.

func set_number(number):
	self.number=number
	var roleList=$icon.get_children()
	for role in roleList:
		if number>int(role.name):
			role.visible=true
		else:
			role.visible=false
	#调整中心点位置
	$icon.position.x=-120+(float(number-1)/21)*120