extends Node2D
class_name GameScene
var team
var battle

onready var map=$ScrollContainer/Map
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
	hero.lv=1
	team.role_append(hero)
	var item=Item_LifeCloak.new()
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
		"村落":
			chooseRole()
		"宝物":
			chooseItem()
func battle():
	battle=load("res://scene/Battle/Battle.tscn").instance()
	eventPlace.add_child(battle)
	battle.connect("win",self,"on_battle_win")
	battle.connect("lose",self,"on_battle_lose")
	battle.start(team)
func on_battle_win():
	#获取战斗后剩余的血量和蓝量,护盾清零
	team.hp=battle.player.hp
	team.mp=battle.player.mp
	team.shield=0
	#升级一个角色
	levelUpPanel.open()
	yield(levelUpPanel,"complete")
	#删除战斗场景
	battle.queue_free()
	
	pass
func on_battle_lose():
	pass
#选择一名同伴加入
func chooseRole():
	var roleChoosePanel=load("res://scene/object/RoleChoosePanel.tscn").instance()
	eventPlace.add_child(roleChoosePanel)
	roleChoosePanel.connect("chooseRole",self,"onChooseRole")
	#传入选择列表
	var list=[]
	var role=Role_Berserker.new()
	list.append(role)
	role=Role_Hero.new()
	list.append(role)
	role=Role_Lion.new()
	list.append(role)
	roleChoosePanel.start(list)
	pass
func onChooseRole(role):
	if role==null:
		return
	team.role_append(role)
	pass
func chooseItem():
	var itemChoosePanel=load("res://scene/object/ItemChoosePanel.tscn").instance()
	eventPlace.add_child(itemChoosePanel)
	itemChoosePanel.connect("chooseItem",self,"onChooseItem")
	#传入选择列表
	var list=[]
	var item=Item_BigSword.new()
	list.append(item)
	item=Item_LightTrunch.new()
	list.append(item)
	item=Item_ShieldScroll.new()
	list.append(item)
	itemChoosePanel.start(list)
	
func onChooseItem(item):
	if item==null:
		return
	team=team as Team
	team.item_append(item)
	#如果物品太多了 丢弃物品
	while team.itemList.size()>team.itemNumber_max:
		var itemChoosePanel=load("res://scene/object/ItemChoosePanel.tscn").instance()
		eventPlace.add_child(itemChoosePanel)
		itemChoosePanel.set_title("物品太多了\n选择一个丢弃")
		itemChoosePanel.start(team.itemList)
		var chooseItem=yield(itemChoosePanel,"chooseItem")
		if chooseItem==null:
			continue
		team.item_remove(chooseItem)
	


func on_roleListUI_checkRole(role):
	#显示角色状态ui
	rolePanel.check_role(role)