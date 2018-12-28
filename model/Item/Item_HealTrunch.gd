extends Item
class_name Item_HealTrunch

func _init():
	type=1
	mingzi="治疗之杖"
	property={"mp":20,
	"hp":40
	}
	triggerList=[]
	description="""最大生命值+40
	最大魔法值+20
	使用：消耗一层能量,治疗自己200点生命
	cd:10
	"""
	
	cost=0
	cd=10
	
	number=3 #使用次数
	isConsume=true #是不是消耗品 消耗品每用一次减少一点次数
	willDisappear=false #使用次数用完后会不会消失
	isShowNumber=true #是否显示使用次数
	
func use():
	var healObj=HealObjFactory.createHeal(owner,owner,200)
	BattleProcess.healProcess(healObj)
	pass