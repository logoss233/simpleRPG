extends Control


var textLabel

func _ready():
	textLabel=$Panel/textLabel
	
func setPos(pos):
	if pos.x<1280/2:
		rect_position.x=pos.x
	else:
		rect_position.x=pos.x-rect_size.x
	if pos.y<720/2-100:
		rect_position.y=pos.y
	else:
		rect_position.y=pos.y-rect_size.y
func set_text(text):
	textLabel.text=text
	
