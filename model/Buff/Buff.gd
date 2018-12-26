extends Reference
class_name Buff


signal property_change
signal number_change
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
var target #目标，附加时指定
var triggerList=[] #触发器列表
var life=3 #持续时间 单位秒
var description="这是一个buff"
var isShow=true #是否在状态栏中显示
var addType="single"  #叠加类型 single:单独，互不影响   cover：覆盖，新的顶替掉旧的 
#					  #increase:增加层数，重置时间
var number=1  setget set_number #buff层数
var number_max=5 #最大叠加层数
func set_number(value):
	number=value
	emit_signal("number_change")
#附加到目标上
func start(target):
	self.target=target
	#把触发器添加到触发器系统中
	for trigger in triggerList:
		#初始化trigger
		trigger.start(target,self)
		TriggerSystem.appendTrigger(trigger)
#结束buff
func end():
	#把触发器从触发器系统中移除
	for trigger in triggerList:
		TriggerSystem.removeTrigger(trigger)
		pass
	pass
func set_property(pr:String,value):
	property[pr]=value
	emit_signal("property_change")
	pass
func increase_property(pr:String,value):
	if !property.has(pr):
		property[pr]=0
	set_property(pr,property[pr]+value)