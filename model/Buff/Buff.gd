extends Reference
class_name Buff
#属性加成形式
#{
#	"atk":10
#	"atk_percent":20  百分比加成
#	"def":10
#	"def_percent":20
#	"speed":10
#	"speed_percent":20
#	"critRate":10  暴击就不做百分比加成了
#	"critPower":0.2
#}
var property:Dictionary={} #属性加成
var mingzi="无名buff"
var target #目标
var triggerList=[] #触发器列表

#附加到目标上
func start(target):
	self.target=target
	for trigger in triggerList:
		TriggerSystem.appendTrigger(trigger)
	pass
func 
