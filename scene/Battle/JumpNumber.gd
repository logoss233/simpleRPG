#跳数字
extends Node2D

var numberLabel

var timer=2 #持续时间
func _ready():
	numberLabel=$numberLabel
	
	
	pass # Replace with function body.

func start(obj,pos:Vector2):
	#如果是伤害
	if obj is DmgObj:
		numberLabel.text=String(obj.dmg)
		#暴击伤害显示为红色
		if obj.isCrit:
			scale=Vector2(2,2)
			modulate=Color.red
		position=pos
		#魔法伤害显示为黄色
		if obj.type==1:
			scale=Vector2(1.5,1.5)
			modulate=Color.yellow
	#如果是治疗
	if obj is HealObj:
		numberLabel.text=String(obj.heal)
		#显示为绿色
		position=pos
		modulate=Color.green
	pass
func _process(delta):
	timer-=delta
	if timer<-0:
		queue_free()
	position.y-=100*delta
	pass