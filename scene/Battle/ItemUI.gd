extends Control
class_name ItemUI


var character
var itemMap={} #skill数据类和显示类的映射

var tscn_itemView=preload("res://scene/Battle/misc/ItemView.tscn")
onready var titleLabel=$Panel/titleLabel
onready var itemPlace=$Panel/ScrollContainer/itemPlace
#-------------初始化----------
func start(_character):
	character=_character
	item_init()
	character.connect("item_remove",self,"item_remove")
	character.connect("item_append",self,"item_append")
	if character is Team:
		character.connect("itemNumber_max_change",self,"on_itemNumber_max_change")
#---------------------------------
func item_init():
	var children=itemPlace.get_children()
	for child in children:
		child.queue_free()
	for item in character.itemList:
		item_append(item)
	update_title()
	pass
func item_append(item):
	var itemView=tscn_itemView.instance()
	itemPlace.add_child(itemView)
	itemMap[item]=itemView
	itemView.start(item)
	#连接信号
	itemView.connect("item_use",self,"on_item_use")
	update_title()
	pass
func item_remove(item):
	itemMap[item].queue_free()
	itemMap.erase(item)
	update_title()
func on_item_use(item):
	character.item_use(item)
	pass
func on_itemNumber_max_change():
	update_title()
	pass
func update_title():
	titleLabel.text="物品栏("+String(character.itemList.size())+"/"+String(character.itemNumber_max)+")："
