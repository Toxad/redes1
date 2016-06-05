
extends Panel

var currentPanel = null

var global_obj

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	pass

func _on_ExitButton_pressed():
	global_obj.changeScene("res://Scenes/menu_scene.scn")

func _on_ClassesButton_pressed():
	changePanel("ClassPanel")

func _on_StatsButtons_pressed():
	changePanel("StatsPanel")

func _on_StatusButton_pressed():
	changePanel("BuffPanel")

func changePanel(msg):
	if(currentPanel != null):
		currentPanel.hide()
	currentPanel = self.get_node(msg)
	currentPanel.show()