#跳数字
extends Node2D


var timer=2 #持续时间


func start(pos):
	position=pos
func _process(delta):
	timer-=delta
	if timer<-0:
		queue_free()
	position.y-=100*delta
	pass