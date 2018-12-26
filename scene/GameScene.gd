extends Node2D


var team


onready var map=$Map
onready var eventPlace=$eventPlace
onready var stateUI=$ui/StateUI
func _ready():
	
	#初始化team
	team=Team.new()
	var hero=Role_Hero.new()
	team.role_append(hero)
	#初始化地图
	map.connect("enterSite",self,"onEnterSite")
	map.start()
	#初始化StateUI
	stateUI.start(team)

func onEnterSite(site):
	site=site as Site
	match site.mingzi:
		"怪物":
			battle()
	
func battle():
	var battle=load("res://scene/Battle/Battle.tscn").instance()
	eventPlace.add_child(battle)