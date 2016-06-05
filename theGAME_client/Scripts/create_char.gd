
extends Panel

var currentPanel = null
var job = null
var global_obj
var points = 15

var Str = 0
var Int = 0
var Agi = 0
var Luk = 0

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	pass


func _on_BackButton_pressed():
	global_obj.changeScene("res://Scenes/menu_scene.scn")


func _on_InfoButton_pressed():
	global_obj.changeScene("res://Scenes/info_scene.scn")


func _on_BerserkerButton_pressed():
	job = "Berserker"
	changePanel("AttributesPanel")

func _on_HunterButton_pressed():
	job = "Hunter"
	changePanel("AttributesPanel")


func _on_KnightButton_pressed():
	job = "Knight"
	changePanel("AttributesPanel")


func _on_MageButton_pressed():
	job = "Mage"
	changePanel("AttributesPanel")

func _on_NecromancerButton_pressed():
	job = "Necromancer"
	changePanel("AttributesPanel")

func _on_RogueButton_pressed():
	job = "Rogue"
	changePanel("AttributesPanel")

func _on_AttBackButton_pressed():
	job = null
	changePanel("ClassPanel")



func changePanel(msg):
	if(currentPanel != null):
		currentPanel.hide()
	currentPanel = self.get_node(msg)
	currentPanel.show()