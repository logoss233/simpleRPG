#战斗系统
extends Node2D
class_name Battle

var player:BattleCharacter
var enemy:BattleCharacter
var playerStateUI
var enemyStateUI
var playerPropertyPanel
var enemyPropertyPanel

var jumpNumberPlace:Node2D
var tscn_JumpNumber=preload("res://scene/Battle/JumpNumber.tscn")

func _ready():
	jumpNumberPlace=$jumpNumberPlace
	
	player=$characters/player
	enemy=$characters/enemy
	playerStateUI=$ui/playerStateUI
	enemyStateUI=$ui/enemyStateUI
	playerPropertyPanel=$ui/playerPropertyPanel
	enemyPropertyPanel=$ui/enemyPropertyPanel
	
	#初始化角色的参数
	player.mingzi="勇者"
	player.face=1
	player.hp_max=200
	player.hp=200
	player.atk_base=100
	player.atk=10
	player.def=5
	player.speed=80
	player.shield=50
	player.critRate_base=0
	player.set_image(load("res://image/playr.png"))
	var buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="攻击强化2" 
	buff.property={
		"atk":100,
		"atk_percent":200
	}
	var trigger=load("res://model/Trigger/Trigger_Test.gd").new()
	trigger.target=player
	buff.triggerList.append(trigger)
	player.buff_append(buff)
	var buff2=load("res://model/Buff/Buff.gd").new()
	buff2.mingzi="攻击强化1"
	buff2.property={
		"atk_percent":200
	}
	player.buff_append(buff2)
	var buff3=load("res://model/Buff/Buff.gd").new()
	buff3.mingzi="神之力量"
	buff3.property={
		"atk":1000,
		"speed":200,
		"critRate":50,
		"critPower":4
	}
	player.buff_append(buff3)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	buff=load("res://model/Buff/Buff.gd").new()
	buff.mingzi="测试buff" 
	buff.property={
	}
	player.buff_append(buff)
	
	
	
	enemy.mingzi="史莱姆"
	enemy.face=-1
	enemy.hp_max=2000
	enemy.hp=2000
	enemy.atk=15
	enemy.def=7
	enemy.speed=60
	enemy.shield=60
	enemy.critRate=40
	enemy.set_image(load("res://image/enemy.png"))
	#注册信号侦听
	player.connect("attack",self,"onAttack")
	player.connect("jumpNumber",self,"onJumpNumber")
	enemy.connect("attack",self,"onAttack")
	enemy.connect("jumpNumber",self,"onJumpNumber")
	#ui初始化
	playerStateUI.start(player)
	enemyStateUI.start(enemy)
	playerPropertyPanel.start(player)
	enemyPropertyPanel.start(enemy)
	
	player.start(self,enemy)
	enemy.start(self,player)
	pass # Replace with function body.

#------------回调-------------
func onAttack(character):
	var fromChara=character as BattleCharacter #攻击来自于
	var toChara:BattleCharacter #受攻击对象
	if character==player:
		toChara=enemy
	else:
		toChara=player
	#伤害减免
	var dr=toChara.def/(toChara.def+100)
	#计算暴击
	var dmg=fromChara.atk
	var isCrit=false
	if randf()*100<fromChara.critRate:
		dmg*=fromChara.critPower
		isCrit=true
	#实际伤害
	dmg=floor(dmg*(1-dr))
	#优先扣除护盾值，再扣除血
	if toChara.shield>0:
		if toChara.shield>=dmg:
			toChara.shield-=dmg
		else:
			var left=dmg-toChara.shield
			toChara.shield=0
			toChara.hp-=left
	else:
		toChara.hp-=dmg
	
	#伤害结果
	var dmgObj={"dmg":dmg,"isCrit":isCrit}
	#受到伤害
	 
	
	toChara.beHit(dmgObj)
	
	print(fromChara.mingzi+"  攻击  "+toChara.mingzi)
	print("造成了 "+String(dmg)+" 点伤害")
func onJumpNumber(dmgObj,position):
	var jumpNumber=tscn_JumpNumber.instance()
	jumpNumberPlace.add_child(jumpNumber)
	jumpNumber.start(dmgObj,position)
	pass
