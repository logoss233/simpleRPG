extends Panel
class_name ItemChoosePanel
signal chooseItem(item)

var checkItem=null setget set_checkItem
var tscn_ItemView=preload("res://scene/Battle/misc/ItemView.tscn")
onready var choosedLabel=$Panel/choosedLabel
onready var itemViewPlace=$Panel/ScrollContainer/itemViewPlace
onready var confirmButton=$Panel/confirmButton
onready var jumpButton=$Panel/jumpButton
onready var titleLabel=$Panel/titleLabel
func set_checkItem(item):
	checkItem=item
	if checkItem==null:
		choosedLabel.text="你还没有选择"
	else:
		choosedLabel.text=checkItem.mingzi

#传入选择的物品的列表
func start(itemList):
	set_checkItem(null)
	for item in itemList:
		var itemView=tscn_ItemView.instance()
		itemViewPlace.add_child(itemView)
		itemView.connect("item_use",self,"onCheckItem")
		itemView.start(item)
	#连接按钮信号
	confirmButton.connect("pressed",self,"comfirm")
	jumpButton.connect("pressed",self,"jump")
func set_title(text:String):
	titleLabel.text=text
	pass
func onCheckItem(item):
	set_checkItem(item)
func comfirm():
	if checkItem==null:
		return
	emit_signal("chooseItem",checkItem)
	queue_free()
func jump():
	emit_signal("chooseItem",null)
	queue_free()
