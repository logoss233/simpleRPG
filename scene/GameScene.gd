extends Node2D
class_name GameScene
signal loose
var team
var battle
var rolePool=[]
var itemPool=[]
var level=0 #等级（进度），每走一步+1

onready var map=$ScrollContainer/Map
onready var eventPlace=$CanvasLayer2/eventPlace
onready var stateUI=$ui/StateUI
onready var propetyPanel=$ui/TeamPropertyPanel
onready var roleListUI=$ui/RoleListUI
onready var rolePanel=$ui/RolePanel
onready var itemUI=$ui/ItemUI
onready var levelUpPanel=$CanvasLayer2/PopupPanel/LevelUpPanel
onready var instructionPanel=$ui/instructionPanel
onready var instructionButto=$ui/instructionButton
func _ready():
	Global.gameScene=self
	#读取角色数据放入角色池中
	for roleClass in Data.roleLab:
		var role=roleClass.new()
		rolePool.append(role)
	#读取物品数据放入物品池中
	for itemClass in Data.itemLab:
		var item=itemClass.new()
		itemPool.append(item)
	
	#初始化team
	team=Team.new()
	var hero=Role_Hero.new()
	hero.lv=1
	team.role_append(hero)
	
	var item=Item_HealTrunch.new()
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
	#初始化说明面板和按钮
	instructionButto.connect("pressed",instructionPanel,"popup_centered")
	
func onEnterSite(site):
	#游戏进度+1
	level+=1
	
	site=site as Site
	match site.mingzi:
		"怪物":
			battle()
		"村落":
			chooseRole()
		"宝物":
			chooseItem()
		"温泉":
			team.hp=team.hp_max
			team.mp=team.mp_max
func battle():
	battle=load("res://scene/Battle/Battle.tscn").instance()
	eventPlace.add_child(battle)
	battle.connect("win",self,"on_battle_win")
	battle.connect("lose",self,"on_battle_lose")
	
	#根据当前进度从数据库中选择一个敌人加入战斗
	var index=floor(level/3)
	if index>Data.enemyLab.size()-1:
		index=Data.enemyLab.size()-1
	var enemy=Data.enemyLab[index].new()
	
	battle.start(team,enemy)
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
	#回复25%生命和魔法
	team.hp+=floor(float(team.hp_max)*0.25)
	team.mp+=floor(float(team.mp_max)*0.25)
	#冷却回复50%
	for skill in team.skillList:
		if skill.type==1 &&skill.cd_timer>0:
			skill.cd_timer=skill.cd_timer/2
	for item in team.itemList:
		if item.type==1 && item.cd_timer>0:
			item.cd_timer=item.cd_timer/2
		pass
	pass
func on_battle_lose():
	emit_signal("loose")
	pass
#选择一名同伴加入
func chooseRole():
	var roleChoosePanel=load("res://scene/object/RoleChoosePanel.tscn").instance()
	eventPlace.add_child(roleChoosePanel)
	roleChoosePanel.connect("chooseRole",self,"onChooseRole")
	#传入选择列表
	var list=[]
	#复制一份角色池
	var tmpRolePool=rolePool.duplicate()
	#从角色池中随机挑选3个角色供玩家选择
	for i in range(3):
		#如果没有角色可以选择了，跳出
		if tmpRolePool.empty():
			break
		#随机一个索引
		var index=floor(randf()*tmpRolePool.size())
		#获取随机角色
		var role=tmpRolePool[index]
		tmpRolePool.remove(index)
		list.append(role)
	roleChoosePanel.start(list)
	pass
func onChooseRole(role):
	if role==null:
		return
	team.role_append(role)
	#把选择的角色从角色池中移除
	rolePool.erase(role)
	pass
func chooseItem():
	var itemChoosePanel=load("res://scene/object/ItemChoosePanel.tscn").instance()
	eventPlace.add_child(itemChoosePanel)
	itemChoosePanel.connect("chooseItem",self,"onChooseItem")
	#传入选择列表
	var list=[]
	#复制一份物品资料
	var tmpItemPool=Data.itemLab.duplicate()
	#从物品池中随机挑选5个物品供玩家选择
	for i in range(5):
		#如果没有物品可以选择了，跳出
		if tmpItemPool.empty():
			break
		#随机一个索引
		var index=floor(randf()*tmpItemPool.size())
		#获取随机物品
		var item=tmpItemPool[index]
		tmpItemPool.remove(index)
		var newItem=item.new()
		list.append(newItem)
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