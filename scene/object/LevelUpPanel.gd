extends Panel
class_name LevelUpPanel
signal complete

var team
var checkRole=null setget set_checkRole
onready var roleListUI=$RoleListUI
onready var roleLevelPanel1=$roleLevelPanel1
onready var roleLevelPanel2=$roleLevelPanel2
onready var confirmButton=$confirmButton
onready var jumpButton=$jumpButton
#--------------
func set_checkRole(value):
	checkRole=value
	#跟新面板显示
	if checkRole==null:
		roleLevelPanel1.visible=false
		roleLevelPanel2.visible=false
	else:
		roleLevelPanel1.visible=true
		roleLevelPanel1.set_role(checkRole,checkRole.lv)
		if checkRole.lv<3:
			roleLevelPanel2.visible=true
			roleLevelPanel2.set_role(checkRole,checkRole.lv+1)
		else:
			roleLevelPanel2.visible=false
	#更新按钮状态
	if checkRole==null:
		confirmButton.disabled=true
	else:
		if checkRole.lv<3:
			confirmButton.disabled=false
		else:
			confirmButton.disabled=true
#-------------
func start(team):
	confirmButton.connect("pressed",self,"confirm")
	jumpButton.connect("pressed",self,"jump")
	roleListUI.connect("checkRole",self,"onCheckRole")
	roleListUI.start(team)
	pass
func open():
	set_checkRole(null)
	visible=true
func close():
	visible=false
	emit_signal("complete")
	pass


func onCheckRole(role):
	set_checkRole(role)
func confirm():
	#确认升级
	checkRole.lv+=1
	close()
	pass
func jump():
	close()
	pass