extends Skill

func _init():
	mingzi="死亡一指"
	description="对敌人造成10000点魔法伤害"
	cost=70
	cd=60

func use():
	var target=owner.oppent
	var dmgObj={
		"from":owner, # 伤害来源
		"to":target,     # 伤害目标
		"dmg":10000, #伤害值
		"isCrit":false, #是否是暴击伤害
		"canCrit":false,  #该伤害能否被暴击
		"type":1,       #类型 0是物理伤害 1是魔法伤害
		"rebound":true  #这个伤害能不能被反弹
	}
	owner.battle.damageProcess(dmgObj)
	pass
