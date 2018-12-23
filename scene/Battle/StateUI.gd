extends Control
class_name StateUI
var max_bar_size=356 #最大血条和魔法条长度

var hp_max=100 setget set_hp_max
var hp=100 setget set_hp
var mp_max=100 setget set_mp_max
var mp=100 setget set_mp
#护盾属性
var shield=20 setget set_shield

#var buffList=[]

var character:BattleCharacter #显示的对象

#引用
var hpLabel:Label
var mpLabel:Label
var shieldLabel:Label
var hpBar:ColorRect
var mpBar:ColorRect
var shieldBar:ColorRect


func set_hp_max(value):
	hp_max=value
	hpLabel.text=String(hp)+"/"+String(hp_max)
func set_hp(value):
	hp=value
	hpLabel.text=String(hp)+"/"+String(hp_max)
	hpBar.rect_size.x=float(hp)/hp_max*max_bar_size
	updateShieldBar()
func set_mp_max(value):
	mp_max=value
	mpLabel.text=String(mp)+"/"+String(mp_max)
func set_mp(value):
	mp=value
	mpLabel.text=String(mp)+"/"+String(mp_max)
	mpBar.rect_size.x=float(mp)/mp_max*max_bar_size
func set_shield(value):
	shield=value
	if shield>0:
		shieldLabel.show()
		shieldLabel.text=String(shield)
	else:
		shieldLabel.hide()
	updateShieldBar()
func updateShieldBar():
	#更新护盾条的长度
	shieldBar.rect_size.x=float(shield)/hp_max*max_bar_size
	#限制护盾条的长度不能超出血条总长度
	if shieldBar.rect_size.x>max_bar_size:
		shieldBar.rect_size.x=max_bar_size
	#默认让护盾条接在血条后面，如果血条比较满，就靠右摆放
	if max_bar_size-hpBar.rect_size.x<shieldBar.rect_size.x:
		shieldBar.rect_position.x=max_bar_size-shieldBar.rect_size.x
	else:
		shieldBar.rect_position.x=hpBar.rect_size.x
	pass
#------------初始化-------------
func _ready():
	hpLabel=$hpLabel
	mpLabel=$mpLabel
	shieldLabel=$shieldLabel
	hpBar=$ColorRect/hpBar
	mpBar=$ColorRect2/mpBar
	shieldBar=$ColorRect/shieldBar
	
	pass # Replace with function body.
func start(character:BattleCharacter):
	self.character=character
	
	#设定初始值
	self.hp_max=character.hp_max
	self.hp=character.hp
	self.mp_max=character.mp_max
	self.mp=character.mp
	self.shield=character.shield
	#连接
	character.connect("state_change",self,"onStateChange")
	
	
	pass
func onStateChange():
	#重置属性
	self.hp=character.hp
	self.mp=character.mp
	self.shield=character.shield
	pass

