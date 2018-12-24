#战斗场景的角色
extends Node2D
class_name BattleCharacter
#-----信号---
signal attack
signal state_change
signal jumpNumber
signal property_change
signal buff_change


#-------
var battle#战斗系统
var oppent:BattleCharacter=null  # 对手
#--------
var mingzi=""
var face=1 #朝向 1表示向右 -1表示向左 

#-----属性---
#直接加减的属性
var hp=100 setget set_hp
var hp_max=100 
var mp=100 setget set_mp
var mp_max=100
var shield=0 setget set_shield#护盾
#根据buff来计算的属性
var atk_base=10
var atk=10
var speed_base=100 #攻击速度
var speed=100
var def_base=10
var def=10
var critRate_base=0 #基础暴击率
var critRate=0 #暴击率
var critPower_base=2 #基础暴击倍率
var critPower=2 #暴击2倍伤害
#
var buffList=[] #buff列表
var skillList=[] #技能列表
#var shieldList=[] #护盾列表

#攻击间隔=1/(speed/100)    100速度时每秒攻击一次，200速度每秒攻击两次
func get_attackInterval():
	  return 1.0/(float(speed)/100)
var attackTimer=0 #攻击间隔计时

var state=-1 setget set_state#状态 0等待 1攻击

var startPos:Vector2 #记录初始位置

#----------引用-----
var tween:Tween

#------------setter---
func set_state(value):
	state=value
	
	pass
func set_hp(value):
	hp=value
	emit_signal("state_change")
func set_mp(value):
	mp=value
	emit_signal("state_change")
func set_shield(value):
	shield=value
	emit_signal("state_change")
#变红
func set_red(value):
	if value==true:
		$icon.modulate=Color.red
	else:
		$icon.modulate=Color.white
	pass
func set_image(image):
	$icon.texture=image
	
#-------------初始化----------------
func _ready():
	tween=$Tween
	pass

func start(battle,oppent):
	self.battle=battle
	self.oppent=oppent
	#重置攻击计时
	attackTimer=get_attackInterval()
	startPos=position
	set_state(0)
	pass


#------------------------------
func _process(delta):
	match state:
		0:  #等待状态
			attackTimer-=delta
			if attackTimer<=0:
			#攻击
				attack()
		1: #攻击状态
			
			
			pass
	
func attack():
	set_state(1) #切换到攻击状态
	tween.interpolate_property(self,"position",position,position+Vector2(50,0)*face,0.2,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	yield(tween,"tween_completed")
	
	emit_signal("attack",self)
	TriggerSystem.sendEvent("attack",self)
	
	tween.interpolate_property(self,"position",position,startPos,0.2,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	yield(tween,"tween_completed")
	#重置攻击计时
	attackTimer=get_attackInterval()
	#切换回等待状态
	set_state(0)
	
	pass
#收到攻击
func beHit(dmgObj):
	set_red(true)
	#跳数字
	emit_signal("jumpNumber",dmgObj,position)
	
	yield(get_tree().create_timer(0.2),"timeout")
	set_red(false)
	
	pass
	
#---------------功能-----
#添加一个buff
func buff_append(buff):
	buffList.append(buff)
	buff.start(self)
	#重新计算属性
	calculateProperty()
	#触发添加buff事件
	
	#发送信号
	emit_signal("buff_change")
	
#移除一个buff
func buff_remove(buff):
	buffList.erase(buff)
	#重新计算属性
	calculateProperty()
	#触发移除buff事件
	
	#发送信号
	emit_signal("buff_change")
	
#计算属性
func calculateProperty():
	#属性附加值
	var _atk=0
	var _atk_percent=0  
	var _def=0
	var _def_percent=0
	var _speed=0
	var _speed_percent=0
	var _critRate=0  
	var _critPower=0
	for buff in buffList:
		var property=buff.property
		var keys=property.keys()
		for key in keys:
			match key:
				"atk":
					_atk+=property["atk"]
				"atk_percent":
					_atk_percent+=property["atk_percent"]
				"def":
					_def+=property["def"]
				"def_percent":
					_def_percent+=property["def_percent"]
				"speed":
					_speed+=property["speed"]
				"speed_percent":
					_speed_percent+=property["speed_percent"]
				"critRate":
					_critRate+=property["critRate"]
				"critPower":
					_critPower+=property["critPower"]
	atk=floor(atk_base*(1+float(_atk_percent)/100)+_atk)
	if atk<atk_base/10:
		atk=atk_base/10
	def=floor(def_base*(1+_def_percent)+_def)
	speed=floor(speed_base*(1+float(_speed_percent)/100)+_speed)
	if speed<speed_base/10:
		speed=speed_base/10
	critRate=critRate_base+_critRate
	if critRate<0:
		critRate=0
	critPower=critPower_base+_critPower
	if critPower<1:
		critPower=1
	#发送信号
	emit_signal("property_change")
	
	