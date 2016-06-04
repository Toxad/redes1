
extends Panel

var global_obj

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	pass

func _on_InfoButton_pressed():
	global_obj.changeScene("res://info_scene.scn")
	pass # replace with function body


func _on_ExitButton_pressed():
	get_tree().quit()
	pass # replace with function body
