extends Skill
class_name Skill_HealthManage

func _init():
	type=0 #被动技能
	mingzi="健康管理"
	descriptionList=["""最大生命值+5%
最大魔法值+5%
攻击+5%
防御+5%
速度+5%
""",
"""最大生命值+10%
最大魔法值+10%
攻击+10%
防御+10%
速度+10%
""",
"""最大生命值+15%
最大魔法值+15%
攻击+15%
防御+15%
速度+15%
"""
]
	propertyList=[{
		"hp_percent":5,
		"mp_percent":5,
		"atk_percent":5,
		"def_percent":5,
		"speed_percent":5
	},{
		"hp_percent":10,
		"mp_percent":10,
		"atk_percent":10,
		"def_percent":10,
		"speed_percent":10
	},{
		"hp_percent":15,
		"mp_percent":15,
		"atk_percent":15,
		"def_percent":15,
		"speed_percent":15
	}]
	
