extends Button

var skill
var isMouseOn=false

var mingziLabel


func _ready():
	mingziLabel=$mingziLabel
	pass 
func start(skill):
	self.skill=skill
	set_mingzi(skill.mingzi)
	
	self.connect("mouse_entered",self,"onMouseEnter")
	self.connect("mouse_exited",self,"onMouseExit")
	pass

func set_mingzi(mingzi):
	mingziLabel.text=mingzi

#-----自身回调-----
func _exit_tree():
	if isMouseOn:
		onMouseExit()
	pass

func onMouseEnter():
	Global.battle.description_enter(skill.description)
	isMouseOn=true
	pass
func onMouseExit():
	isMouseOn=false
	Global.battle.description_exit()
	pass
func _gui_input(event):
	if event is InputEventMouse:
		Global.battle.description_set_pos(event.global_position)
	pass
