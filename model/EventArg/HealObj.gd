extends Reference
class_name HealObj


var from=null # 治疗来源
var to=null  # 治疗目标
var heal=0    #治疗值

func _init(dic=null):
	if dic==null:
		return
	var keys=dic.keys()
	for key in keys:
		set(key,dic[key])
