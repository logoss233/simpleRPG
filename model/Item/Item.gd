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
var isConsume=false #是不是消耗品 消耗品每用一次减少一点次数
var willDisappear=false #使用次数用完后会不会消失
var isShowNumber=false #是否显示使用次数

var canBattleUse=true #战斗中能否使用
var canMapUse=false #大地图中能否使用  #暂时不做地图使用


func use():
	pass

func start(owner):
	self.owner=owner
	#初始化触发器的变量，不会把触发器添加到触发器系统
	for trigger in triggerList:
		trigger.start(owner,self)