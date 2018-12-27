extends Button

var skill
var isMouseOn=false

var mingziLabel

onready var typeLabel=$typeLabel
func _ready():
	mingziLabel=$mingziLabel
	pass 
func start(skill):
	self.skill=skill
	set_mingzi()
	set_type()
	self.connect("mouse_entered",self,"onMouseEnter")
	self.connect("mouse_exited",self,"onMouseExit")
	pass

func set_mingzi():
	mingziLabel.text=skill.mingzi+"Lv"+String(skill.lv)
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
	Global.descriptionPanel.description_enter(skill.description)
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
