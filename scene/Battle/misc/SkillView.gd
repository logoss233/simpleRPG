extends Button
signal skill_use

var skill
var isStart=false
var isMouseOn=false
#---

var mingziLabel
var costLabel
var shade #遮罩 技能冷却时显示
var cdLabel


func _ready():
	mingziLabel=$mingziLabel
	costLabel=$costLabel
	shade=$shade
	cdLabel=$cdLabel
	pass # Replace with function body.

func start(skill):
	self.skill=skill
	set_mingzi(skill.mingzi)
	set_cd(skill.cd_timer)
	set_cost(skill.cost)
	isStart=true
	#连接信号
	self.connect("pressed",self,"onPressed")
	self.connect("mouse_entered",self,"onMouseEnter")
	self.connect("mouse_exited",self,"onMouseExit")
	pass
func set_mingzi(mingzi):
	mingziLabel.text=mingzi
func set_cd(cd_timer):
	if cd_timer<=0:
		shade.visible=false
		cdLabel.visible=false
	else:
		shade.visible=true
		cdLabel.visible=true
		cdLabel.text=String(ceil(cd_timer))
	pass
func set_cost(cost):
	costLabel.text=String(cost)
#----------------------
func _process(delta):
	if !isStart:
		return
	#更新cd
	set_cd(skill.cd_timer)
	pass
	
#-------------------
func onPressed():
	emit_signal("skill_use",skill)

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
