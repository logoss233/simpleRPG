extends Control

var character:BattleCharacter

var skillMap={} #skill数据类和显示类的映射

var tscn_skillView=preload("res://scene/Battle/misc/SkillView.tscn")
var skillViewPlace
#-------------初始化----------
func _ready():
	skillViewPlace=$ScrollContainer/skillViewPlace
	
	pass # Replace with function body.
func start(_character):
	character=_character as BattleCharacter
	skill_init()
	
	pass
#---------------------------------
func skill_init():
	var children=skillViewPlace.get_children()
	for child in children:
		child.queue_free()
	for skill in character.skillList:
		#只显示主动技能
		if skill.type==1:
			skill_append(skill)
	pass
func skill_append(skill):
	var skillView=tscn_skillView.instance()
	skillViewPlace.add_child(skillView)
	skillMap[skill]=skillView
	skillView.start(skill)
	#连接信号
	skillView.connect("skill_use",self,"on_skill_use")
	pass
func skill_remove(skill):
	skillMap[skill].queue_free()
	skillMap.erase(skill)
	
func on_skill_use(skill):
	character.skill_use(skill)
	pass