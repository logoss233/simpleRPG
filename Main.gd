extends Node2D

var gameScene

onready var gameScenePlace=$gameScenePlace
onready var loosePanel=$CanvasLayer/loosePanel
# Called when the node enters the scene tree for the first time.
func _ready():
	gameScene=load("res://scene/GameScene.tscn").instance()
	gameScenePlace.add_child(gameScene)
	gameScene.connect("loose",self,"onLoose")
	pass # Replace with function body.

func onLoose():
	loosePanel.visible=true
	loosePanel.get_node("restartButton").connect("pressed",self,"restart")
	
	pass
func restart():
	loosePanel.visible=false
	loosePanel.get_node("restartButton").disconnect("pressed",self,"restart")
	gameScene.queue_free()
	yield(get_tree().create_timer(0.1),"timeout")
	gameScene=load("res://scene/GameScene.tscn").instance()
	gameScenePlace.add_child(gameScene)
	gameScene.connect("loose",self,"onLoose")
	pass