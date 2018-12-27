extends Node2D
class_name GameScene
var team
var battle


onready var map=$Map
onready var eventPlace=$CanvasLayer2/eventPlace
onready var stateUI=$ui/StateUI
onready var propetyPanel=$ui/TeamPropertyPanel
onready var roleListUI=$ui/RoleListUI
onready var rolePanel=$ui/RolePanel
onready var itemUI=$ui/ItemUI
onready var levelUpPanel=$CanvasLayer2/PopupPanel/LevelUpPanel
func _ready():
	Global.gameScene=self
	#初始化team
	team=Team.new()
	var hero=Role_Hero.new()
	hero.lv=3
	team.role_append(hero)
	
	var lion=Role_Lion.new()
	team.role_append(lion)
	
	var berserker=Role_Berserker.new()
	berserker.lv=2
	team.role_append(berserker)
	
	var item=Item_BigSword.new()
	team.item_append(item)
	item=Item_ShieldScroll.new()
	team.item_append(item)
	item=Item_LightTrunch.new()
	team.item_append(item)
	item=Item_RoundShield.new()
	team.item_append(item)
	
	#初始化地图
	map.connect("enterSite",self,"onEnterSite")
	map.start()
	#初始化StateUI
	stateUI.start(team)
	propetyPanel.start(team)
	#初始化角色列表ui
	roleListUI.connect("checkRole",self,"on_roleListUI_checkRole")
	roleListUI.start(team)
	#初始化物品栏ui
	itemUI.start(team)
	#初始化升级面板
	levelUpPanel.start(team)

func onEnterSite(site):
	site=site as Site
	match site.mingzi:
		"怪物":
			battle()
	
func battle():
	battle=load("res://scene/Battle/Battle.tscn").instance()
	eventPlace.add_child(battle)
	battle.connect("win",self,"on_battle_win")
	battle.connect("lose",self,"on_battle_lose")
	battle.start(team)
func on_battle_win():
	levelUpPanel.open()
	yield(levelUpPanel,"complete")
	#获取战斗后剩余的血量和蓝量,护盾清零
	team.hp=battle.player.hp
	team.mp=battle.player.mp
	team.shield=0
	battle.queue_free()
	pass
func on_battle_lose():
	pass

func on_roleListUI_checkRole(role):
	#显示角色状态ui
	rolePanel.check_role(role)