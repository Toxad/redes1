
extends Panel

var currentPanel = null

func _ready():
	currentPanel = self.get_node("ClassBerserkerPanel")
	currentPanel.show()

func _on_ClassBerserkerButton_pressed():
	changeClassPanel("ClassBerserkerPanel")

func _on_ClassHunterButton_pressed():
	changeClassPanel("ClassHunterPanel")

func _on_ClassKnightButton_pressed():
	changeClassPanel("ClassKnightPanel")

func _on_ClassMageButton_pressed():
	changeClassPanel("ClassMagePanel")

func _on_ClassNecromancerButton_pressed():
	changeClassPanel("ClassNecromancerPanel")

func _on_ClassRogueButton_pressed():
	changeClassPanel("ClassRoguePanel")

func changeClassPanel(msg):
	currentPanel.hide()
	currentPanel = self.get_node(msg)
	currentPanel.show()