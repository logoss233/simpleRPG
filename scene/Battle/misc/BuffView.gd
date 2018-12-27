extends Button

var buff
var isStart=false
var isMouseOn=false
#--
var mingziLabel
var numberLabel
var lifeLabel

func _ready():
	mingziLabel=$mingziLabel
	numberLabel=$numberLabel
	lifeLabel=$lifeLabel
	pass 
func start(buff):
	self.buff=buff
	set_mingzi(buff.mingzi)
	set_number(buff.number)
	set_life(buff.life)
	
	buff.connect("number_change",self,"on_number_change")
	self.connect("mouse_entered",self,"onMouseEnter")
	self.connect("mouse_exited",self,"onMouseExit")
	isStart=true
	
	pass
func _process(delta):
	if isStart:
		set_life(buff.life)
	
func set_mingzi(mingzi):
	mingziLabel.text=mingzi
func set_number(number):
	if number<=1:
		numberLabel.text=""
	else:
		numberLabel.text="X"+String(number)
	pass
func set_life(life):
	lifeLabel.text=String(ceil(life))+"S"
func on_number_change():
	set_number(buff.number)
	
#-----自身回调-----
func _exit_tree():
	if isMouseOn:
		onMouseExit()
	pass

func onMouseEnter():
	Global.descriptionPanel.description_enter(buff.description)
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
