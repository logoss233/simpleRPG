#跳数字
extends Node2D

var numberLabel

var timer=2 #持续时间
func _ready():
	numberLabel=$numberLabel
	
	
	pass # Replace with function body.

func start(dmgObj,pos:Vector2):
	numberLabel.text=String(dmgObj.dmg)
	#暴击伤害显示为红色
	if dmgObj.isCrit:
		scale=Vector2(2,2)
		modulate=Color.red
	position=pos
	#魔法伤害显示为黄色
	if dmgObj.type==1:
		scale=Vector2(1.5,1.5)
		modulate=Color.yellow
	
	pass
func _process(delta):
	timer-=delta
	if timer<-0:
		queue_free()
	position.y-=100*delta
	pass