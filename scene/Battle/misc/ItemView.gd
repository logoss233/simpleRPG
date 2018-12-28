extends Button
signal item_use

var item:Item
var isStart=false
var isMouseOn=false
#---

onready var mingziLabel=$mingziLabel
var costLabel
var shade #遮罩 技能冷却时显示
var cdLabel


func _ready():
	
	costLabel=$costLabel
	shade=$shade
	cdLabel=$cdLabel
	pass # Replace with function body.

func start(item):
	self.item=item
	#初始化显示
	var text=item.mingzi
	if item.isShowNumber:
		text+="*"+String(item.number)
	set_mingzi(text)
	set_cd(item.cd_timer)
	if item.type==0 || item.cost==0:
		mingziLabel.align=ALIGN_CENTER
		mingziLabel.anchor_bottom=1
		mingziLabel.anchor_right=1
		mingziLabel.margin_left=0
		mingziLabel.margin_top=0
		mingziLabel.margin_right=0
		mingziLabel.margin_bottom=0
		costLabel.visible=false
	else:
		set_cost(item.cost)
	isStart=true
	#连接信号
	item.connect("number_change",self,"on_number_change")
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
	set_cd(item.cd_timer)
	pass
	
#-------------------
func onPressed():
	emit_signal("item_use",item)
func on_number_change():
	var text=item.mingzi
	if item.isShowNumber:
		text+="*"+String(item.number)
	set_mingzi(text)
#-----自身回调-----
func _exit_tree():
	if isMouseOn:
		onMouseExit()
	pass

func onMouseEnter():
	Global.descriptionPanel.description_enter(item.description)
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