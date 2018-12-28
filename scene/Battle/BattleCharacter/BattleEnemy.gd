extends BattleCharacter
class_name BattleEnemy
var enemy


func set_enemy(enemy):
	self.enemy=enemy
	enemy.battleEnemy=self
	face=-1
	mingzi=enemy.mingzi
	set_image(enemy.img)
	hp_max=enemy.hp
	hp=hp_max
	mp_max=enemy.mp
	mp=mp_max
	atk_base=enemy.atk
	def_base=enemy.def
	speed_base=enemy.speed
	skillList=enemy.skillList
func _process(delta):
	enemy.process(delta)