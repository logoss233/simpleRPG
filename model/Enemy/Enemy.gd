extends Reference
class_name Enemy

var mingzi="史莱姆"
var img #图片
var hp=500
var mp=100
var atk=40
var def=30
var speed=110
var skillList=[]

var battleEnemy

func process(delta):
	for skill in battleEnemy.skillList:
		if skill.type==1 && skill.cd>0 && skill.cost<battleEnemy.mp:
			battleEnemy.skill_use(skill)