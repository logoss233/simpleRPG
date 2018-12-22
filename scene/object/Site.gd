#大地图上显示的地点
extends Node2D
signal pressed

var mingzi:String=""  setget set_mingzi#名字


#引用


func set_mingzi(value):
	mingzi=value
	$mingziButton.text=value



func _ready():
	$mingziButton.connect("pressed",self,"onButtonPressed")
	
	
	self.mingzi="怪物"
	self.connect("pressed",self,"testPressed")
	pass # Replace with function body.

func onButtonPressed():
	emit_signal("pressed",mingzi)
	
func testPressed(mingzi):
	print(mingzi)

