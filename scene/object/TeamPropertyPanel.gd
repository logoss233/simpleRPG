extends Panel

var team:Team
onready var atkLabel=$atkLabel
onready var defLabel=$defLabel
onready var speedLabel=$speedLabel

func start(team):
	self.team=team
	team.connect("property_change",self,"on_property_change")
	on_property_change()
	pass

func on_property_change():
	atkLabel.text=String(team.atk)
	defLabel.text=String(team.def)
	speedLabel.text=String(team.speed)
	pass
