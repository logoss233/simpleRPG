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
var target #目标

#附加到目标上
func start(target):
	self.target=target
	pass
#附加到对象时触发
func enter():
	print("buff enter")
	pass

#移除时触发
func exit():
	print("buff exit")
	pass
