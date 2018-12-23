#跳数字
extends Node2D

var numberLabel

var timer=2 #持续时间
func _ready():
	numberLabel=$numberLabel
	
	
	pass # Replace with function body.

func start(number,pos:Vector2):
	numberLabel.text=String(number)
	position=pos
	
	pass
func _process(delta):
	timer-=delta
	if timer<-0:
		queue_free()
	position.y-=100*delta
	pass