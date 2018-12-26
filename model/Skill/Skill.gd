#技能
extends Reference
class_name Skill

var type=0 #0被动 1主动
var mingzi="无名技能"
var owner #技能主人
var property={} #属性
var triggerList=[] #触发器 被动效果
var description="这是一个技能"
var cost=50 #魔法消耗
var cd=10 #冷却时间
var cd_timer=0 #cd计时器

func use():
	
	pass
func start(owner):
	self.owner=owner
	#把所有触发器添加到触发器列表
	for trigger in triggerList:
		trigger.start(owner,self)

