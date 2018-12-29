extends Item
class_name Item_ShieldScroll

func _init():
	type=1
	mingzi="护盾卷轴"
	property={}
	triggerList=[]
	description="消耗，获得1500点护盾"
	isConsume=true #是不是消耗品 消耗品每用一次减少一点次数
	willDisappear=true #使用次数用完后会不会消失
	
func use():
	owner.shield+=1500