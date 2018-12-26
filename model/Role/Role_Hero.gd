extends Role
class_name Role_Hero

func _init():
	mingzi="卡卡罗特" #名字
	lv=1 #等级
	title="勇者" #称号
	description=""
	property={
		"hp":100,
		"mp":30,
		"atk":20,
		"def":10,
		"speed":30
	} #属性
	var skill=load("res://model/Skill/Skill_Crit.gd").new()
	skillList.append(skill)
	