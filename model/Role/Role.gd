#角色类
extends Reference
class_name Role
signal level_change(role)

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
		#简单技能不会随着等级提升而提升
		if skill.lv>0:
			skill.lv=value
	emit_signal("level_change",self)
func get_property():
	return propertyList[lv-1]