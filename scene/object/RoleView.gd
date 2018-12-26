extends Button
class_name RoleView

var role

onready var mingziLabel=$mingziLabel
onready var lvLabel=$lvLabel
onready var titleLabel=$titleLabel
func start(role):
	self.role=role
	mingziLabel.text=role.mingzi
	lvLabel.text="Lv "+String(role.lv)
	titleLabel.text=role.title