extends Panel
class_name RoleChoosePanel
signal chooseRole(role)

var checkRole=null setget set_checkRole


var tscn_roleView=preload("res://scene/object/RoleView.tscn")
onready var roleViewPlace=$Panel/RoleViewPlace
onready var roleLevelPanel=$Panel/RoleLevelPanel
onready var confirmButtom=$Panel/confirmButton
onready var jumpButton=$Panel/jumpButton

func set_checkRole(role):
	checkRole=role
	if checkRole==null:
		roleLevelPanel.visible=false
	else:
		roleLevelPanel.visible=true
		roleLevelPanel.set_role(checkRole,checkRole.lv)
	
	
#传入要选择的角色列表
func start(roleList):
	set_checkRole(null)
	for role in roleList:
		var roleView=tscn_roleView.instance()
		roleViewPlace.add_child(roleView)
		roleView.connect("checkRole",self,"onCheckRole")
		roleView.start(role)
	#连接按钮信号
	confirmButtom.connect("pressed",self,"comfirm")
	jumpButton.connect("pressed",self,"jump")
func onCheckRole(role):
	set_checkRole(role)
func comfirm():
	if checkRole==null:
		return
	emit_signal("chooseRole",checkRole)
	queue_free()
func jump():
	emit_signal("chooseRole",null)
	queue_free()
