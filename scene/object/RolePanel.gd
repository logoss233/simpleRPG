extends WindowDialog
class_name RolePanel

var role

var tscn_skillView=load("res://scene/Battle/misc/PassiveSkillView.tscn")
onready var mingziLabel=$mingziLabel
onready var lvLabel=$lvLabel
onready var titleLabel=$titleLabel
onready var hpLabel=$hpLabel
onready var mpLabel=$mpLabel
onready var atkLabel=$atkLabel
onready var defLabel=$defLabel
onready var speedLabel=$speedLabel
onready var skillPlace=$skillPlace
#初始化
func check_role(_role):
	if visible==false:
		set_role(_role)
		popup_centered()
	else:
		if role==_role:
			hide()
		else:
			set_role(_role)
	
	pass
	

func set_role(_role):
	role=_role
	mingziLabel.text=role.mingzi
	lvLabel.text="LV"+String(role.lv)
	titleLabel.text=role.title
	var property=role.property
	hpLabel.text=String(property.hp)
	mpLabel.text=String(property.mp)
	atkLabel.text=String(property.atk)
	defLabel.text=String(property.def)
	speedLabel.text=String(property.speed)
	#清除skillPlace
	var children=skillPlace.get_children()
	for child in children:
		child.queue_free()
	#添加技能显示
	for skill in role.skillList:
		var skillView=tscn_skillView.instance()
		skillPlace.add_child(skillView)
		skillView.start(skill)
		pass
	
	
	pass