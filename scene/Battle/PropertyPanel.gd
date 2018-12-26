extends Control

var character

var tscn_buffView=preload("res://scene/Battle/misc/BuffView.tscn")
var tscn_passiveSkillView=preload("res://scene/Battle/misc/PassiveSkillView.tscn")
var buffMap={} #数据buff和显示buff的映射

#------------引用-------
var mingziLabel
var atkLabel
var defLabel
var speedLabel
var buffPlace:Control

#-----------初始化-----------
func _ready():
	mingziLabel=$Panel/mingziLabel
	atkLabel=$Panel/atkLabel
	defLabel=$Panel/defLabel
	speedLabel=$Panel/speedLabel
	buffPlace=$Panel/ScrollContainer/buffPlace
	pass # Replace with function body.

func start(_character):
	character=_character as BattleCharacter
	
	character.connect("property_change",self,"on_property_change")
	#character.connect("buff_change",self,"on_buff_change")
	character.connect("buff_append",self,"onBuff_append")
	character.connect("buff_remove",self,"onBuff_remove")
	#初始化内容
	mingziLabel.text=character.mingzi
	on_property_change()
	passiveSkill_init()
	buff_init()
	
#------------------------------------
func on_property_change():
	atkLabel.text=String(character.atk)
	defLabel.text=String(character.def)
	speedLabel.text=String(character.speed)
	
	changePropertyLabelColor(character.atk,character.atk_base,atkLabel)
	changePropertyLabelColor(character.def,character.def_base,defLabel)
	changePropertyLabelColor(character.speed,character.speed_base,speedLabel)
	
#初始化被动技能
func passiveSkill_init():
	var children=buffPlace.get_children()
	for child in children:
		child.queue_free()
	for skill in character.skillList:
		if skill.type==0:
			passiveSkill_add(skill)
func passiveSkill_add(skill):
	var skillView=tscn_passiveSkillView.instance()
	buffPlace.add_child(skillView)
	skillView.start(skill)
	pass
#初始化buff
func buff_init():

	for buff in character.buffList:
		if buff.isShow:
			buff_add(buff)
		pass
	pass
func onBuff_append(buff):
	if buff.isShow:
		buff_add(buff)
func buff_add(buff):
	var buffView=tscn_buffView.instance()
	buffPlace.add_child(buffView)
	#添加到映射
	buffMap[buff]=buffView
	buffView.start(buff)
func onBuff_remove(buff):
	if buff.isShow:
		buff_remove(buff)
func buff_remove(buff):
	#删除buffView
	buffMap[buff].queue_free()
	#从映射移除
	buffMap.erase(buff)
	pass

#改变属性的颜色
func changePropertyLabelColor(property,property_base,label):
	if property>property_base:
		label.modulate=Color.green
	elif property==property_base:
		label.modulate=Color.white
	else:
		label.modulate=Color.red