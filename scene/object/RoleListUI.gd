extends Control
class_name RoleListUI

var team:Team
#数据类和显示对应的列表
var roleMap={} 

var tscn_RoleView=preload("res://scene/object/RoleView.tscn")
onready var rolePlace=$ScrollContainer/rolePlace

func start(team):
	self.team=team
	role_init()
	
	
	team.connect("role_append",self,"role_append")
	team.connect("role_remove",self,"role_remove")
	pass

func role_init():
	var children=rolePlace.get_children()
	for child in children:
		child.queue_free()
	#初始化
	for role in team.roleList:
		role_append(role)
		pass
func role_append(role):
	var roleView=tscn_RoleView.instance()
	rolePlace.add_child(roleView)
	roleView.start(role)
	roleMap[role]=roleView
func role_remove(role):
	var roleView=roleMap[role]
	roleMap.erase(role)
	roleView.queue_free()