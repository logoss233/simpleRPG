extends Panel
class_name RoleLevelPanel

var role

var tscn_skillLevelView=preload("res://scene/Battle/misc/SkillLevelView.tscn")
var tscn_skillPassiveView=preload("res://scene/Battle/misc/PassiveSkillView.tscn")
onready var mingziLabel=$mingziLabel
onready var lvLabel=$lvLabel
onready var titleLabel=$titleLabel
onready var hpLabel=$hpLabel
onready var mpLabel=$mpLabel
onready var atkLabel=$atkLabel
onready var defLabel=$defLabel
onready var speedLabel=$speedLabel
onready var skillPlace=$skillPlace

#传入角色和要查看的等级
func set_role(_role,lv):
	role=_role
	mingziLabel.text=role.mingzi
	lvLabel.text="LV"+String(lv)
	titleLabel.text=role.title
	var property=role.propertyList[lv-1]
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
		if skill.lv>0: #显示等级技能
			var skillView=tscn_skillLevelView.instance()
			skillPlace.add_child(skillView)
			skillView.start(skill,lv)
		else:  #显示简单技能
			var skillView=tscn_skillPassiveView.instance()
			skillPlace.add_child(skillView)
			skillView.start(skill)
		pass
	
	
	pass