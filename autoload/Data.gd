#游戏的静态数据
extends Node

#队友数据库
var roleLab=[]
#物品数据库
var itemLab=[]
#敌人数据库
var enemyLab=[]



func _ready():
	roleLab=[
		Role_Berserker,
		Role_Doctor,
		Role_Lion,
		Role_MagicDefender,
		Role_Oracle,
		Role_ShadowDancer,
		Role_Shaman,
		Role_SwordMaster,
		Role_VampirePrinecess,
		Role_Valkrie,
		Role_GreatMage,
		Role_AntiMagic,
		Role_BurstMage,
		Role_Priestess
	]
	
	itemLab=[
		Item_BigSword,
		Item_DeddyDagger,
		Item_GuardRing,
		Item_HealTrunch,
		Item_LifeCloak,
		Item_LightTrunch,
		Item_RoundShield,
		Item_ShieldScroll,
		Item_SpeedTruch,
		Item_SlowTrunch
	]
	
	enemyLab=[
		Enemy_Slime,
		Enemy_Mouse,
		Enemy_Bat,
		Enemy_Cactus,
		Enemy_Mage,
		Enemy_Skeleton,
		Enemy_Smoke,
		Enemy_TreeMan,
		Enemy_FlyFish,
		Enemy_StoneMan,
		Enemy_Stone,
		Enemy_Rider
	]
	
	pass # Replace w