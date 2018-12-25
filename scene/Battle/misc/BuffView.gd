extends Button

var buff
var isStart=false

var mingziLabel
var numberLabel
var lifeLabel

func _ready():
	mingziLabel=$mingziLabel
	numberLabel=$numberLabel
	lifeLabel=$lifeLabel
	pass 
func start(buff):
	self.buff=buff
	set_mingzi(buff.mingzi)
	set_number(buff.number)
	set_life(buff.life)
	
	buff.connect("number_change",self,"on_number_change")
	
	isStart=true
	
	pass
func _process(delta):
	if isStart:
		set_life(buff.life)
	
func set_mingzi(mingzi):
	mingziLabel.text=mingzi
func set_number(number):
	if number<=1:
		numberLabel.text=""
	else:
		numberLabel.text="X"+String(number)
	pass
func set_life(life):
	lifeLabel.text=String(ceil(life))+"S"
func on_number_change():
	set_number(buff.number)
	
	
