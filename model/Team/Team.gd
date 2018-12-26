#小队 由所有队友的属性相加而成 
extends Reference
class_name Team
#----信号----
signal property_change
signal state_change
signal role_append
signal role_remove
#-----属性---

#直接加减的属性
var hp=100 setget set_hp
var mp=100 setget set_mp
var shield=0 setget set_shield
#根据队员和技能计算出的属性
var hp_max=100 setget set_hp_max
var mp_max=100 setget set_mp_max
var atk=10
var speed=100
var def=10


var roleList=[] #队员列表
var skillList=[] #技能列表 所有队员的技能集合
var itemList=[] #物品列表
#----------setter----
#队员人数
func get_number():
	return roleList.size()
func set_hp(value):
	hp=value
	if hp>hp_max:
		hp=hp_max
	emit_signal("state_change")
	pass
func set_mp(value):
	mp=value
	if mp>mp_max:
		mp=mp_max
	emit_signal("state_change")
	pass
func set_shield(value):
	shield=value
	emit_signal("state_change")
	pass
func set_hp_max(value):
	var origin=hp_max
	hp_max=value
	#最大生命值改变时，生命值按百分比改变
	var tmp_hp=floor(hp*(float(hp_max)/origin))
	if tmp_hp<=0:
		tmp_hp=1
	self.hp=tmp_hp
func set_mp_max(value):
	var origin=mp_max
	mp_max=value
	self.mp=floor(mp*(float(mp_max)/origin))
#------------------
#添加队员
func role_append(role):
	#队员添加到列表中
	roleList.append(role)
	#把队员的技能添加到列表中
	for skill in role.skillList:
		skillList.append(skill)
	calculateProperty()
#移除队员
func role_remove(role):
	roleList.remove(role)
	for skill in role.skillList:
		skillList.erase(skill)
	calculateProperty()
#添加物品
func item_append(item):
	itemList.append(item)
	calculateProperty()
#移除物品
func item_remove(item):
	itemList.erase(item)
	calculateProperty()
#计算属性
func calculateProperty():
	#属性附加值
	var _hp_max=0 
	var _hp_max_percent=0
	var _mp_max=0
	var _mp_max_percent=0
	var _atk=0
	var _atk_percent=0  
	var _def=0
	var _def_percent=0
	var _speed=0
	var _speed_percent=0
	var objList=roleList+skillList+itemList
	for obj in objList:
		var property=obj.property
		var keys=property.keys()
		for key in keys:
			match key:
				"hp":
					_hp_max+=property["hp"]
				"hp_percent":
					_hp_max_percent+=property["hp_percent"]
				"mp":
					_mp_max+=property["mp"]
				"mp_percent":
					_mp_max_percent+=property["mp_percent"]
				"atk":
					_atk+=property["atk"]
				"atk_percent":
					_atk_percent+=property["atk_percent"]
				"def":
					_def+=property["def"]
				"def_percent":
					_def_percent+=property["def_percent"]
				"speed":
					_speed+=property["speed"]
				"speed_percent":
					_speed_percent+=property["speed_percent"]
	self.hp_max=floor(_hp_max*(1+float(_hp_max_percent)/100))
	self.mp_max=floor(_mp_max*(1+float(_mp_max_percent)/100))
	self.atk=floor(_atk*(1+float(_atk_percent)/100))
	self.def=floor(_def*(1+float(_def_percent)/100))
	self.speed=floor(_speed*(1+float(_speed_percent)/100))
	emit_signal("property_change")