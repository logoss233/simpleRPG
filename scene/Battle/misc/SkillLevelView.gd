extends Button

var skill
var lv
var isMouseOn=false

var mingziLabel

onready var typeLabel=$typeLabel
func _ready():
	mingziLabel=$mingziLabel
	pass 
#传入技能和想要查看的等级
func start(skill,lv):
	self.skill=skill
	self.lv=lv
	set_mingzi()
	set_type()
	self.connect("mouse_entered",self,"onMouseEnter")
	self.connect("mouse_exited",self,"onMouseExit")
	pass

func set_mingzi():
	mingziLabel.text=skill.mingzi+"Lv"+String(lv)
func set_type():
	if skill.type==0:
		typeLabel.text="被动"
	else:
		typeLabel.text="主动"
	
	pass
#-----自身回调-----
func _exit_tree():
	if isMouseOn:
		onMouseExit()
	pass

func onMouseEnter():
	Global.descriptionPanel.description_enter(skill.descriptionList[lv-1])
	isMouseOn=true
	pass
func onMouseExit():
	isMouseOn=false
	Global.descriptionPanel.description_exit()
	pass
func _gui_input(event):
	if event is InputEventMouse:
		Global.descriptionPanel.description_set_pos(event.global_position)
	pass
