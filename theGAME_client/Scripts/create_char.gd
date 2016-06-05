
extends Panel

var global_obj

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	pass




func _on_BackButton_pressed():
	global_obj.changeScene("res://Scenes/menu_scene.scn")


func _on_InfoButton_pressed():
	global_obj.changeScene("res://Scenes/info_scene.scn")
