#简单技能 没有等级 不能升级
extends Reference
class_name SimpleSkill

var lv=0
var type=0 #0被动 1主动
var mingzi="无名技能"
var owner #技能主人
var property={} 
var triggerList=[] 
var description=""
var cost=0
var cd=0
var cd_timer=0 #cd计时器
func use():
	pass
func start(owner):
	self.owner=owner
	#初始化触发的变量，不会把触发器添加到触发器系统
	for trigger in triggerList:
		trigger.start(owner,self)
