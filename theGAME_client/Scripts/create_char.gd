
extends Panel

var currentPanel = null
var job = null
var global_obj


var Str = 0
var Int = 0
var Agi = 0
var Luk = 0
var sum = Str+Agi+Int+Luk

func changePanel(msg):
	if(currentPanel != null):
		currentPanel.hide()
	currentPanel = self.get_node(msg)
	currentPanel.show()

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.set_process(true)

func _process(delta):
	self.get_node("AttributesPanel/StrNode/StrValue").set_text(str(Str))
	self.get_node("AttributesPanel/AgiNode/AgiValue").set_text(str(Agi))
	self.get_node("AttributesPanel/IntNode/IntValue").set_text(str(Int))
	self.get_node("AttributesPanel/LukNode/LukValue").set_text(str(Luk))
	self.get_node("AttributesPanel/AttPoints").set_text(str(15-sum))
	sum = Str+Agi+Int+Luk
	
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
	Str = 0
	Agi = 0
	Int = 0
	Luk = 0
	changePanel("ClassPanel")

func _on_StrPlus_pressed():
	if(sum < 15):
		Str += 1

func _on_StrMinus_pressed():
	if(sum > 0):
		Str -= 1

func _on_AgiPlus_pressed():
	if(sum <15):
		Agi += 1

func _on_AgiMinus_pressed():
	if(sum > 0):
		Agi -= 1

func _on_IntPlus_pressed():
	if(sum <15):
		Int += 1

func _on_IntMinus_pressed():
	if(sum > 0):
		Int -= 1

func _on_LukPlus_pressed():
	if(sum <15):
		Luk += 1

func _on_LukMinus_pressed():
	if(sum > 0):
		Luk -= 1

func _on_next_pressed():
	changePanel("SkillsPanel")


func _on_SkillsBackButton_pressed():
	Str = 0
	Agi = 0
	Int = 0
	Luk = 0
	changePanel("AttributesPanel")


func _on_ConfirmBackButton_pressed():
	changePanel("SkillsPanel")
	#zerar skills


func _on_RestartButton_pressed():
	Str = 0
	Agi = 0
	Int = 0
	Luk = 0
	job = null
	#zerar skills
	changePanel("ClassPanel")


func _on_SkillsNextButton_pressed():
	changePanel("ConfirmPanel")
