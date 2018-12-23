#大地图上的玩家棋子
extends Node2D
class_name MapPlayer
signal moveComplete

var site:Site #当前所在的地点
onready var tween=$Tween
func _ready():
	pass # Replace with function body.

#移动到地点
func move(site):
	self.site=site
	tween.interpolate_property(self,"position",null,site.position,1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	yield(tween,"tween_completed")
	emit_signal("moveComplete")
	pass
