extends Item
class_name Item_SpeedTruch

func _init():
	type=1
	mingzi="速度之杖"
	property={"mp":20,
	"speed":15
	}
	triggerList=[]
	description="""速度+15
	最大魔法值+20
	使用：消耗一层能量,增加50点速度，持续5秒
	cd:10
	"""
	
	cost=0
	cd=10
	
	number=3 #使用次数
	isConsume=true #是不是消耗品 消耗品每用一次减少一点次数
	willDisappear=false #使用次数用完后会不会消失
	isShowNumber=true #是否显示使用次数
	
func use():
	#生成一个持续5秒的buff加到使用者身上
	var buff=Buff.new()
	buff.mingzi="速度之杖"
	buff.life=5
	buff.property={
		"speed":50
		}
	
	buff.description="增加50点速度"
	buff.isShow=true
	buff.addType="single"
	owner.buff_append(buff)