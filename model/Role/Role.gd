#角色类
extends Reference
class_name Role


var mingzi="无名" #名字
var lv=1 setget set_lv#等级
var title="战士" #称号
var description="一个无名的战士"
var propertyList=[{},{},{}] 
var property setget ,get_property
var skillList=[] #根据角色等级决定技能等级

func set_lv(value):
	lv=value
	for skill in skillList:
		skill.lv=value

func get_property():
	return propertyList[lv-1]