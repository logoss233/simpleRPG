extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Line2D.add_point(Vector2(100,100))
	$Line2D.add_point(Vector2(200,100))
	pass # Replace with function body.


