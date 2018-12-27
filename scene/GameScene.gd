extends Node2D

var team



onready var map=$Map
onready var eventPlace=$CanvasLayer2/eventPlace
onready var stateUI=$ui/StateUI
onready var propetyPanel=$ui/TeamPropertyPanel
onready var roleListUI=$ui/RoleListUI
onready var rolePanel=$ui/RolePanel
func _ready():
	
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

	#初始化地图
	map.connect("enterSite",self,"onEnterSite")
	map.start()
	#初始化StateUI
	stateUI.start(team)
	propetyPanel.start(team)
	
	roleListUI.connect("checkRole",self,"on_roleListUI_checkRole")
	roleListUI.start(team)
	

func onEnterSite(site):
	site=site as Site
	match site.mingzi:
		"怪物":
			battle()
	
func battle():
	var battle=load("res://scene/Battle/Battle.tscn").instance()
	eventPlace.add_child(battle)
	battle.start(team)

func on_roleListUI_checkRole(role):
	#显示角色状态ui
	rolePanel.check_role(role)
	pass