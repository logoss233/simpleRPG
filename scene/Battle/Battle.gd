#战斗系统
extends Node2D
class_name Battle

var player:BattleCharacter
var enemy:BattleCharacter
var playerStateUI
var enemyStateUI
var playerPropertyPanel
var enemyPropertyPanel
var skillUI

var jumpNumberPlace:Node2D
var tscn_JumpNumber=preload("res://scene/Battle/JumpNumber.tscn")
var tscn_JumpSkillMingzi=preload("res://scene/Battle/misc/JumpSkillName.tscn")


func _ready():
	jumpNumberPlace=$jumpNumberPlace
	
	player=$characters/player
	enemy=$characters/enemy
	playerStateUI=$ui/playerStateUI
	enemyStateUI=$ui/enemyStateUI
	playerPropertyPanel=$ui/playerPropertyPanel
	enemyPropertyPanel=$ui/enemyPropertyPanel
	skillUI=$ui/SkillUI
	#初始化角色的参数
	player.mingzi="勇者小队"
	player.face=1
	player.hp_max=200
	player.hp=200
	player.mp_max=200
	player.mp=200
	player.atk_base=100
	player.atk=10
	player.def_base=100
	player.def=5
	player.speed=80
	player.shield=50
	player.critRate_base=0
	player.set_image(load("res://image/playr.png"))
#	var buff=load("res://model/Buff/Buff.gd").new()
#	buff.mingzi="攻击降低" 
#	buff.isShow=true
#	buff.life=10
#	buff.property={
#		"atk":100,
#		"atk_percent":200
#	}
#	var trigger=load("res://model/Trigger/Trigger_Test.gd").new()
#	trigger.target=player
#	trigger.owner=buff
#	buff.triggerList.append(trigger)
#	player.buff_append(buff)
#	var buff2=load("res://model/Buff/Buff.gd").new()
#	buff2.mingzi="攻击强化1"
#	buff2.property={
#		"atk_percent":200
#	}
#	player.buff_append(buff2)
#	var buff3=load("res://model/Buff/Buff.gd").new()
#	buff3.isShow=true
#	buff3.mingzi="神之力量"
#	buff3.property={
#		"atk":1000,
#		"speed":200,
#		"critRate":50,
#		"critPower":4
#	}
#	player.buff_append(buff3)
#
#	buff=load("res://model/Buff/Buff.gd").new()
#	buff.mingzi="测试buff" 
#	buff.property={
#	}
	#test
	var skill=load("res://model/Skill/Skill_PowerUp.gd").new()
	skill.owner=player
	player.skillList.append(skill)
	var skill2=load("res://model/Skill/Skill_DeathFinger.gd").new()
	skill2.owner=player
	player.skillList.append(skill2)
	var skill3=load("res://model/Skill/Skill_Berserk.gd").new()
	skill3.owner=player
	player.skillList.append(skill3)
	var skill4=load("res://model/Skill/Skill_Bloodthirsty.gd").new()
	skill4.owner=player
	player.skillList.append(skill4)
	var skill5=load("res://model/Skill/Skill_GodPower.gd").new()
	skill5.owner=player
	player.skillList.append(skill5)
	
	
	
	enemy.mingzi="史莱姆"
	enemy.face=-1
	enemy.hp_max=2000
	enemy.hp=2000
	enemy.atk=15
	enemy.def_base=100
	enemy.def=100
	enemy.speed=60
	enemy.shield=60
	enemy.critRate=40
	enemy.set_image(load("res://image/enemy.png"))
	#注册信号侦听
	player.connect("attack",self,"onAttack")
	player.connect("jumpNumber",self,"onJumpNumber")
	player.connect("jumpSkillMingzi",self,"onJumpSkillMingzi")
	enemy.connect("attack",self,"onAttack")
	enemy.connect("jumpNumber",self,"onJumpNumber")
	enemy.connect("jumpSkillMingzi",self,"onJumpSkillMingzi")
	#ui初始化
	playerStateUI.start(player)
	enemyStateUI.start(enemy)
	playerPropertyPanel.start(player)
	enemyPropertyPanel.start(enemy)
	skillUI.start(player)
	
	
	player.start(self,enemy)
	enemy.start(self,player)
	pass # Replace with function body.

#------------回调-------------
func onAttack(fromChara,toChara):
	#生成一个dmgObj
	var dmgObj={
		"from":fromChara, # 伤害来源
		"to":toChara,     # 伤害目标
		"dmg":fromChara.atk, #伤害值
		"isCrit":false, #是否是暴击伤害
		"canCrit":true,  #该伤害能否被暴击
		"type":0,       #类型 0是物理伤害 1是魔法伤害
		"rebound":true  #这个伤害能不能被反弹
		}
	damageProcess(dmgObj)

	
func onJumpNumber(dmgObj,position):
	var jumpNumber=tscn_JumpNumber.instance()
	jumpNumberPlace.add_child(jumpNumber)
	jumpNumber.start(dmgObj,position)
	pass
func onJumpSkillMingzi(mingzi,position):
	var jump=tscn_JumpSkillMingzi.instance()
	jumpNumberPlace.add_child(jump)
	jump.start(mingzi,position)
	pass
#-------------------------------
#伤害处理
func damageProcess(dmgObj):
	var from=dmgObj.from
	var to=dmgObj.to
	#计算暴击
	if dmgObj.canCrit:
		if randf()*100<from.critRate:
			dmgObj.dmg*=from.critPower
			dmgObj.isCrit=true
	#如果是物理伤害，用防御减免，魔法伤害不处理
	if dmgObj.type==0:
		#正防御
		if to.def>0:
			var dr=float(to.def)/(to.def+100)
			dmgObj.dmg=floor(dmgObj.dmg*(1-dr))
		elif to.def<0: #负防御  防御如果为0 不做处理
			var ir=float(abs(to.def))/(abs(to.def)+100)
			dmgObj.dmg=floor(dmgObj.dmg*(1+ir))
	else:
		pass
	#优先扣除护盾值，再扣除血
	if to.shield>0:
		if to.shield>=dmgObj.dmg:
			to.shield-=dmgObj.dmg
		else:
			var left=dmgObj.dmg-to.shield
			to.shield=0
			to.hp-=left
	else:
		to.hp-=dmgObj.dmg
	
	#受到伤害
	to.beHit(dmgObj)
	
	pass
	
	
