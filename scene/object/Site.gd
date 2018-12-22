#大地图上显示的地点
extends Node2D
class_name Site
signal pressed

var mingzi:String=""  setget set_mingzi#名字

var nextSiteList=[] #后一个site 可以走的site
var preSiteList=[] #前一个site

#引用


func set_mingzi(value):
	mingzi=value
	$mingziButton.text=value



func _ready():
	$mingziButton.connect("pressed",self,"onButtonPressed")
	
	
	self.connect("pressed",self,"testPressed")
	pass # Replace with function body.



func onButtonPressed():
	emit_signal("pressed",mingzi)
	
func testPressed(mingzi):
	print(mingzi)

func get_leftConncetPosition():
	return $leftConnectPosition.position+position
	pass
func get_rightConnectPosition():
	return $rightConnectPosition.position+position
	pass