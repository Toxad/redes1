
extends Panel

var global_obj

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	pass

