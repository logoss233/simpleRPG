#战斗系统
extends Node2D

var player:BattleCharacter
var enemy:BattleCharacter
var playerStateUI:StateUI
var enemyStateUI:StateUI

var jumpNumberPlace:Node2D
var tscn_JumpNumber=preload("res://scene/Battle/JumpNumber.tscn")

func _ready():
	jumpNumberPlace=$jumpNumberPlace
	
	player=$characters/player
	enemy=$characters/enemy
	playerStateUI=$ui/playerStateUI
	enemyStateUI=$ui/enemyStateUI
	
	#初始化角色的参数
	player.mingzi="勇者"
	player.face=1
	player.hp_max=200
	player.hp=200
	player.atk=10
	player.def=5
	player.speed=80
	player.shield=50
	
	enemy.mingzi="史莱姆"
	enemy.face=-1
	enemy.hp_max=150
	enemy.hp=150
	enemy.atk=15
	enemy.def=7
	enemy.speed=60
	enemy.shield=60
	#注册信号侦听
	player.connect("attack",self,"onAttack")
	player.connect("jumpNumber",self,"onJumpNumber")
	enemy.connect("attack",self,"onAttack")
	enemy.connect("jumpNumber",self,"onJumpNumber")
	#
	playerStateUI.start(player)
	enemyStateUI.start(enemy)
	
	
	player.start()
	enemy.start()
	pass # Replace with function body.

func onAttack(character):
	var fromChara=character as BattleCharacter #攻击来自于
	var toChara:BattleCharacter #受攻击对象
	if character==player:
		toChara=enemy
	else:
		toChara=player
	#伤害减免
	var dr=toChara.def/(toChara.def+100)
	#实际伤害
	var dmg=floor(fromChara.atk*(1-dr))
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
	
	#受到伤害 
	toChara.beHit(dmg)
	
	print(fromChara.mingzi+"  攻击  "+toChara.mingzi)
	print("造成了 "+String(dmg)+" 点伤害")
func onJumpNumber(number,position):
	var jumpNumber=tscn_JumpNumber.instance()
	jumpNumberPlace.add_child(jumpNumber)
	jumpNumber.start(number,position)
	pass
