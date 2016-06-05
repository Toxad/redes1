
extends Panel

var global_obj

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")

func _on_InfoButton_pressed():
	global_obj.changeScene("res://Scenes/info_scene.scn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_NewMatchButton_pressed():
	global_obj.changeScene("res://Scenes/create_char.scn")
