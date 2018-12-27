extends Control
class_name DescriptionPanel

var textLabel

func _ready():
	Global.descriptionPanel=self
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
	
#-----------------功能------
func description_enter(description):
	visible=true
	set_text(description)
	pass
func description_exit():
	visible=false
	pass
func description_set_pos(pos):
	setPos(pos)
	pass