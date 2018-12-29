extends Item
class_name Item_LightTrunch

func _init():
	type=1
	mingzi="闪电之杖"
	property={"mp":30,
	"speed":15
	}
	triggerList=[]
	description="""魔法最大值+30
	速度+15
	使用：消耗一层能量,发出一道闪电攻击敌人，造成300点魔法伤害
	cd:8
	"""
	
	cost=0
	cd=8
	
	number=3 #使用次数
	isConsume=true #是不是消耗品 消耗品每用一次减少一点次数
	willDisappear=false #使用次数用完后会不会消失
	isShowNumber=true #是否显示使用次数
	
func use():
	var dmgObj=DmgObjFactory.createMagicDmg(owner,owner.oppent,300)
	BattleProcess.damageProcess(dmgObj)
	pass