#跳数字
extends Node2D

var mingziLabel

var timer=2 #持续时间
func _ready():
	mingziLabel=$mingziLabel
	
	
	pass # Replace with function body.

func start(mingzi,pos):
	mingziLabel.text=mingzi
	position=pos
func _process(delta):
	timer-=delta
	if timer<-0:
		queue_free()
	position.y-=100*delta
	pass