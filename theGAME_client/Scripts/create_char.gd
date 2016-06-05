extends Panel

var currentPanel = null
var job = null
var global_obj
var skill_list = []
var selected_skills = []

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
	self.get_node("ConfirmPanel/PlayerName/Content").set_text(global_obj.get_player_name())
	self.get_node("SkillsPanel/Control/Skill1").set_toggle_mode(true)

func _process(delta):
	self.get_node("AttributesPanel/StrNode/StrValue").set_text(str(Str))
	self.get_node("AttributesPanel/AgiNode/AgiValue").set_text(str(Agi))
	self.get_node("AttributesPanel/IntNode/IntValue").set_text(str(Int))
	self.get_node("AttributesPanel/LukNode/LukValue").set_text(str(Luk))
	self.get_node("AttributesPanel/AttPoints").set_text(str(15-sum))
	sum = Str+Agi+Int+Luk

################################   JOB

func _on_BackButton_pressed():
	global_obj.changeScene("res://Scenes/menu_scene.scn")

func _on_InfoButton_pressed():
	global_obj.changeScene("res://Scenes/info_scene.scn")

func _on_BerserkerButton_pressed():
	job = "Berserker"
	self.get_node("ConfirmPanel/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")

func _on_HunterButton_pressed():
	job = "Hunter"
	self.get_node("ConfirmPanel/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")

func _on_KnightButton_pressed():
	job = "Knight"
	self.get_node("ConfirmPanel/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")

func _on_MageButton_pressed():
	job = "Mage"
	self.get_node("ConfirmPanel/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")

func _on_NecromancerButton_pressed():
	job = "Necromancer"
	self.get_node("ConfirmPanel/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")

func _on_RogueButton_pressed():
	job = "Rogue"
	self.get_node("ConfirmPanel/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")

################################   STATS

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
func _on_AttNextButton_pressed():
	self.get_node("ConfirmPanel/PlayerAttributes/Content").set_text("STR: "+str(Str)+"\nAGI: "+str(Agi)+"\nINT: "+str(Int)+"\nLUK: "+str(Luk))
	self.get_node("SkillsPanel/SkillsDisplayClass").set_text(job)
	if(job == "Berserker"):		
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_texture(load("res://Images/Blood_Strike.tex"))
	elif(job == "Hunter"):
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_texture(load("res://Images/Focused_Shot.tex"))
	elif(job == "Knight"):
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_texture(load("res://Images/Honor_Strike.tex"))
	elif(job == "Mage"):
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_texture(load("res://Images/Fireball.tex"))
	elif(job == "Necromancer"):
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_texture(load("res://Images/Unfathomable_Darkness.tex"))
	elif(job == "Rogue"):
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_texture(load("res://Images/Double_Attack.tex"))
	changePanel("SkillsPanel")
	
################################   SKILLS

func _on_SkillsBackButton_pressed():
	Str = 0
	Agi = 0
	Int = 0
	Luk = 0
	changePanel("AttributesPanel")

func _on_Skill1_toggled(pressed):
	if(pressed):
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_self_opacity(0.5)

func _on_SkillsNextButton_pressed():
	changePanel("ConfirmPanel")

################################   CONFIRM

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


