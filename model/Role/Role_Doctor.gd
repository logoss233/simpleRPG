extends Role
class_name Role_Doctor

func _init():
	mingzi="格雷" #名字
	title="医生" #称号
	description=""
	propertyList=[{
		"hp":50,
		"mp":20,
		"atk":4,
		"def":3,
		"speed":4
	},
	{
		"hp":100,
		"mp":40,
		"atk":8,
		"def":6,
		"speed":8
	},
	{
		"hp":150,
		"mp":60,
		"atk":12,
		"def":9,
		"speed":12
	}
	]
	
	skillList=[Skill_HealthManage.new()]