#技能
extends Reference
class_name Skill

var lv=1 #等级
var type=0 #0被动 1主动
var mingzi="无名技能"
var owner #技能主人
var propertyList=[{},{},{}]
var property setget ,get_property
var triggerListList=[[],[],[]]
var triggerList setget ,get_triggerList
var descriptionList=["","",""]
var description setget ,get_description
var costList=[60,60,60]
var cost setget ,get_cost
var cdList=[10,10,10] 
var cd setget ,get_cd #冷却时间
var cd_timer=0 #cd计时器

func get_property():
	return propertyList[lv-1]
func get_cost():
	return costList[lv-1]
func get_cd():
	return cdList[lv-1]
func get_triggerList():
	return triggerListList[lv-1]
func get_description():
	return descriptionList[lv-1]

func use():
	
	pass
func start(owner):
	self.owner=owner
	#初始化触发的变量，不会把触发器添加到触发器系统
	for trigger in get_triggerList():
		trigger.start(owner,self)

