extends BattleCharacter
class_name BattlePlayer

var number=1 #一共有几个人
var itemNumber_max=1 #最大物品数量




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