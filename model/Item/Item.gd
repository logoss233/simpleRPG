#物品类
extends Reference
class_name Item

var type=0 #0不能使用 1可以使用
var mingzi="贵族圆环"
var owner #主人
var property={}
var triggerList=[]
var description="最大生命+10，最大魔法+10，攻击+10，防御+10，速度+10"
var cost=0 #使用消耗魔法
var cd=10 #冷却时间
var cd_timer=0 #冷却计数
var number=1 #使用次数
var consume=false #次数使用完了会不会消失

func use():
	pass

func start(owner):
	self.onwer=owner
	#把所有触发器添加到触发器列表
	for trigger in triggerList:
		trigger.start(owner,self)