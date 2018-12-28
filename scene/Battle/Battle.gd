#战斗系统
extends Node2D
class_name Battle

signal win
signal lose

var player
var enemy
var playerStateUI
var enemyStateUI
var playerPropertyPanel
var enemyPropertyPanel
var skillUI
onready var itemUI=$ui/ItemUI

var jumpNumberPlace:Node2D
var tscn_JumpNumber=preload("res://scene/Battle/JumpNumber.tscn")
var tscn_JumpSkillMingzi=preload("res://scene/Battle/misc/JumpSkillName.tscn")
var tscn_JumpMiss=preload("res://scene/Battle/misc/JumpMiss.tscn")
func _ready():
	Global.battle=self
	
	jumpNumberPlace=$jumpNumberPlace
	player=$characters/player
	enemy=$characters/enemy
	playerStateUI=$ui/playerStateUI
	enemyStateUI=$ui/enemyStateUI
	playerPropertyPanel=$ui/playerPropertyPanel
	enemyPropertyPanel=$ui/enemyPropertyPanel
	skillUI=$ui/SkillUI

	


func start(team:Team):
	#初始化角色的参数
	player.mingzi="勇者小队"
	player.face=1
	player.hp_max=team.hp_max
	player.hp=team.hp
	player.mp_max=team.mp_max
	player.mp=team.mp
	player.atk_base=team.atk
	player.def_base=team.def
	player.speed_base=team.speed
	player.shield=team.shield
	player.skillList=team.skillList
	player.itemList=team.itemList
	player.set_number(team.get_number())
	player.itemNumber_max=team.itemNumber_max
	
	enemy.set_enemy(Enemy_Slime.new())
#	enemy.mingzi="史莱姆"
#	enemy.face=-1
#	enemy.hp_max=400
#	enemy.hp=400
#	enemy.atk_base=60
#	enemy.def_base=30
#	enemy.speed_base=80
#	enemy.shield=0
#	enemy.set_image(load("res://image/enemy.png"))
#	var skill=load("res://model/Skill/Skill_Dodge.gd").new()
#	enemy.skillList.append(skill)
	
	
	#注册信号侦听
	player.connect("attack",self,"onAttack")
	player.connect("jumpNumber",self,"onJumpNumber")
	player.connect("jumpSkillMingzi",self,"onJumpSkillMingzi")
	player.connect("jumpMiss",self,"onJumpMiss")
	player.connect("die",self,"onDie")
	enemy.connect("attack",self,"onAttack")
	enemy.connect("jumpNumber",self,"onJumpNumber")
	enemy.connect("jumpSkillMingzi",self,"onJumpSkillMingzi")
	enemy.connect("jumpMiss",self,"onJumpMiss")
	enemy.connect("die",self,"onDie")
	#ui初始化
	playerStateUI.start(player)
	enemyStateUI.start(enemy)
	playerPropertyPanel.start(player)
	enemyPropertyPanel.start(enemy)
	skillUI.start(player)
	itemUI.start(player)
	
	player.start(self,enemy)
	enemy.start(self,player)
	
	#发出战斗开始事件
	TriggerSystem.sendEvent("battle_start",null)
	pass

func _process(delta):
	TriggerSystem.sendEvent("process",delta)

#------------回调-------------
func onAttack(fromChara,toChara):
#	var dmgObj=DmgObj.new({
#		"from":fromChara, # 伤害来源
#		"to":toChara,     # 伤害目标
#		"dmg":fromChara.atk, #伤害值
#		"isCrit":false, #是否是暴击伤害
#		"canCrit":true,  #该伤害能否被暴击
#		"type":0,       #类型 0是物理伤害 1是魔法伤害
#		"rebound":true  #这个伤害能不能被反弹
#	})
	var dmgObj=DmgObjFactory.createAttackDmg(fromChara,toChara,fromChara.atk)
	
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
func onJumpMiss(pos):
	var jump=tscn_JumpMiss.instance()
	jumpNumberPlace.add_child(jump)
	jump.start(pos)
func onDie(character):
	player.set_process(false)
	enemy.set_process(false)
	itemUI.set_visible(false)
	skillUI.set_visible(false)
	Global.descriptionPanel.set_visible(false)
	#去除所有触发器
	TriggerSystem.triggerList=[]
	#等待1.5秒
	yield(get_tree().create_timer(1.5),"timeout")
	if character==enemy:
		win()
	else:
		lose()
func win():
	emit_signal("win")
	pass
func lose():
	emit_signal("lose")

#--------------静态函数-----------------
#伤害处理
static func damageProcess(dmgObj):
	var from=dmgObj.from
	var to=dmgObj.to
	if to.state=="die" || from.state=="die":
		return
	#伤害开始前
	TriggerSystem.sendEvent("damage_before",dmgObj)
	#闪避阶段  如果闪避了 跳过下面的流程
	TriggerSystem.sendEvent("dodge",dmgObj)
	if dmgObj.isDodge:
		#显示闪避效果
		to.dodge()
		return
	#暴击阶段
	TriggerSystem.sendEvent("crit",dmgObj)
	
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
	#如果dmg小于0，把它变成0
	if dmgObj.dmg<0:
		dmgObj.dmg=0
	#伤害结算阶段 优先扣除护盾值，再扣除血
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
	#伤害之后事件
	TriggerSystem.sendEvent("damage_after",dmgObj)
	
	
	pass
static func heatProcess(healObj):
	var from=healObj.from
	var to=healObj.to
	if to.state=="die" || from.state=="die":
		return
	#治疗开始前
	TriggerSystem.sendEvent("heal_before",healObj)
	#治疗
	if healObj.heal<0:
		healObj.heal=0
	to.hp+=healObj.heal
	#跳出治疗数字
	to.beHeal(healObj)
	pass
	
