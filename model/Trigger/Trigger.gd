#触发器
extends Reference
class_name Trigger

var character #指定一名角色
var item #指定一个技能 或buff 或物品
#事件
var event=""
#条件 返回true或者false
func condition(eventArg):
	pass
#行为
func action(eventArg):
	pass

func start(character,item):
	self.character=character
	self.item=item
	pass