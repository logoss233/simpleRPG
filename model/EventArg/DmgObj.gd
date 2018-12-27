extends Reference
class_name DmgObj


var from=null # 伤害来源
var to=null  # 伤害目标
var dmg=0    #伤害值
var isCrit=false  #是否是暴击伤害
var canCrit=false  #该伤害能否被暴击
var critBaseDmg=0   #暴击基础伤害 覆盖暴击时会用到
var critPower=1     #暴击倍率 
var type=0       #类型 0是物理伤害 1是魔法伤害
var rebound=true    #能否被反弹
var canDodge=false  #能否被闪避
var isDodge=false  #是否已经被闪避了
var isNormalAttack=false #这个伤害是不是普通攻击伤害

func _init(dic=null):
	if dic==null:
		return
	var keys=dic.keys()
	for key in keys:
		set(key,dic[key])


