extends Panel

var currentPanel = null
var job = null
var global_obj
var selected_skills = {}
#var available_skills = {}
var connect_status = ""
var time = 0
var MAX_SKILLS = 4
const SKILL_PATH = "res://Scripts/Skills/"

var button_skills = []

func changePanel(msg):
	if(currentPanel != null):
		currentPanel.hide()
	currentPanel = self.get_node(msg)
	currentPanel.show()

func dir_skills(path):
	var dir = Directory.new()
	if (dir.open(path) == OK):
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var i = 1											#Controle de indice do botão
		while (file_name != "" and i <= MAX_SKILLS):		#percorre arquivos do diretório enquanto existem e na quantidade de skills disponíveis
			if(file_name != "." and file_name != ".."):		#ignora arquivos "falsos" retornados pela função
				file_name = file_name.split(".", false)		#separa nome do arquivo de sua extensão
				var skill = self.get_parent().get_node("/root/"+file_name[0])
				#available_skills[skill.get_name()] = skill	#coloca skill no dicionario de skills disponiveis
				button_skills.append(skill)					#atribui skill a botão na ordem
				self.get_node("SkillsPanel/Control/Skill"+str(i)+"/Sprite").set_texture(load(skill.get_icon()))
				file_name = dir.get_next()
				i += 1
			else:
				file_name = dir.get_next()


			
func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerName/Content").set_text(global_obj.get_player_name())		#Nome obtido do player
	self.get_node("SkillsPanel/Control/Skill1").set_toggle_mode(true)												#Habilita botoes
	self.get_node("SkillsPanel/Control/Skill2").set_toggle_mode(true)
	self.get_node("SkillsPanel/Control/Skill3").set_toggle_mode(true)
	self.get_node("SkillsPanel/Control/Skill4").set_toggle_mode(true)
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerSkills/SkillList").push_align(2)								#Align Right

	
func _process(delta):
	time = time + delta
	if(self.connect_status == ""):
		self.get_node("ConfirmPanel/ConfirmConnect/Dialogue").set_text("Started finding a match")
		#print("Started finding a match")
		self.connect_status = "Finding Match"
		global_obj.send(8, "Find Match")
		time = 0
	else:
		var packet = global_obj.receive_packet()
		var adversary = global_obj.get_adversary()
		if(connect_status == "Finding Match"):
			# remanda em caso de perda
			if(time > 5):
				self.get_node("ConfirmPanel/ConfirmConnect/Dialogue").set_text("Re: Finding Match")
				#print("Re: Finding Match")
				global_obj.send(8, "Find Match")
				time = 0
		elif(connect_status == "Found Match"):
			if(time > 1):
				global_obj.send_match(16, adversary)
				time = 0
		elif(connect_status == "Ready"):
			if(time > 1):
				print("Mandou um 16 para o adversario")
				global_obj.send_match(16, adversary)
				print("Fim! Muda de cena")
				global_obj.changeScene("res://Scenes/battle_scene.scn")
				self.set_process(false)
				time = 0
		if(packet != null):
			if(packet[0] == 0):
				# erro
				self.get_node("ConfirmPanel/ConfirmConnect/Dialogue").set_text(str("erro: ",packet[1]))
				#print(str("erro: ",packet[1]))
				self.set_process(false)
			elif(packet[0] == 8 and self.connect_status != "Ready"):
				# recebeu de servidor; adversario no pacote; send para adversario
				self.connect_status = "Found Match"
				self.get_node("ConfirmPanel/ConfirmConnect/Dialogue").set_text(self.connect_status)
				#print(self.connect_status)
				global_obj.set_adversary(packet[3], packet[4])
				time = 0
			elif(packet[0] == 16):
				# recebeu de adversario; adversario no pacote; send para adversario
				self.connect_status = "Ready"
				print("Chegou em estado: ready")
				if(global_obj.get_adversary() == null):
					var ip = global_obj.pack_ip()
					global_obj.set_adversary(packet[1], ip)
				#print(self.connect_status)
				self.get_node("ConfirmPanel/ConfirmConnect/Dialogue").set_text(self.connect_status)
				time = 0

################################   JOB

func _on_BackButton_pressed():
	global_obj.changeScene("res://Scenes/menu_scene.scn")

func _on_InfoButton_pressed():
	global_obj.changeScene("res://Scenes/info_scene.scn")

func _on_BerserkerButton_pressed():
	job = "Berserker"
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")
	update_stats()

func _on_HunterButton_pressed():
	job = "Hunter"
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")
	update_stats()

func _on_KnightButton_pressed():
	job = "Knight"
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")
	update_stats()

func _on_MageButton_pressed():
	job = "Mage"
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")
	update_stats()

func _on_NecromancerButton_pressed():
	job = "Necromancer"
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")
	update_stats()

func _on_RogueButton_pressed():
	job = "Rogue"
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerClass/Content").set_text(job)
	changePanel("AttributesPanel")
	update_stats()

################################   STATS

var Str = 0
var Int = 0
var Agi = 0
var Luk = 0
var sum = Str+Agi+Int+Luk

func update_stats():
	self.get_node("AttributesPanel/StrNode/StrValue").set_text(str(Str))
	self.get_node("AttributesPanel/AgiNode/AgiValue").set_text(str(Agi))
	self.get_node("AttributesPanel/IntNode/IntValue").set_text(str(Int))
	self.get_node("AttributesPanel/LukNode/LukValue").set_text(str(Luk))
	sum = Str+Agi+Int+Luk
	self.get_node("AttributesPanel/AttPoints").set_text(str(15-sum))

func _on_AttBackButton_pressed():
	job = null
	Str = 0
	Agi = 0
	Int = 0
	Luk = 0
	selected_skills.clear()
	button_skills.clear()
	#available_skills.clear()
	self.reset_skill_buttons()
	changePanel("ClassPanel")
	

func _on_StrPlus_pressed():
	if(sum < 15 and Str < 10):
		Str += 1
	update_stats()

func _on_StrMinus_pressed():
	if(sum > 0 and Str > 0):
		Str -= 1
	update_stats()

func _on_AgiPlus_pressed():
	if(sum < 15 and Agi < 10):
		Agi += 1
	update_stats()

func _on_AgiMinus_pressed():
	if(sum > 0 and Agi > 0):
		Agi -= 1
	update_stats()

func _on_IntPlus_pressed():
	if(sum < 15 and Int < 10):
		Int += 1
	update_stats()

func _on_IntMinus_pressed():
	if(sum > 0 and Int > 0):
		Int -= 1
	update_stats()

func _on_LukPlus_pressed():
	if(sum < 15 and Luk < 10):
		Luk += 1
	update_stats()

func _on_LukMinus_pressed():
	if(sum > 0 and Luk > 0):
		Luk -= 1
	update_stats()

func _on_AttNextButton_pressed():
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerAttributes/Content").set_text("STR: "+str(Str)+"\nAGI: "+str(Agi)+"\nINT: "+str(Int)+"\nLUK: "+str(Luk))
	self.get_node("SkillsPanel/SkillsDisplayClass").set_text(job)
	var path = SKILL_PATH+job+"/"
	dir_skills(path)											#Preenche botões de skill
	changePanel("SkillsPanel")
	
################################   SKILLS

func _on_SkillsBackButton_pressed():
	Str = 0
	Agi = 0
	Int = 0
	Luk = 0
	var path = SKILL_PATH+job+"/"
	dir_skills(path)
	selected_skills.clear()
	self.reset_skill_buttons()
	changePanel("AttributesPanel")


####BOTAO 1####
func _on_Skill1_toggled(pressed):
	if(pressed):																	#botão toggles, adiciona skill do botão correspondente no dicionario 
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_self_opacity(0.5)
		selected_skills[button_skills[0].get_name()] = button_skills[0] 
	else:
		self.get_node("SkillsPanel/Control/Skill1/Sprite").set_self_opacity(1)		#retira do dicionario
		selected_skills.erase(button_skills[0].get_name())
		
func _on_Skill1_mouse_enter():
	get_node("SkillsPanel/Control/Skill1/Tooltip/SkillInfo1").set_text(button_skills[0].get_info())
	get_node("SkillsPanel/Control/Skill1/Tooltip").show()

func _on_Skill1_mouse_exit():
	get_node("SkillsPanel/Control/Skill1/Tooltip").hide()

####BOTAO 2####
func _on_Skill2_toggled(pressed):
	if(pressed):
		self.get_node("SkillsPanel/Control/Skill2/Sprite").set_self_opacity(0.5)
		selected_skills[button_skills[1].get_name()] = button_skills[1] 
	else:
		self.get_node("SkillsPanel/Control/Skill2/Sprite").set_self_opacity(1)
		selected_skills.erase(button_skills[1].get_name())

func _on_Skill2_mouse_enter():
	get_node("SkillsPanel/Control/Skill2/Tooltip/SkillInfo2").set_text(button_skills[1].get_info())
	get_node("SkillsPanel/Control/Skill2/Tooltip").show()

func _on_Skill2_mouse_exit():
	get_node("SkillsPanel/Control/Skill2/Tooltip").hide()

####BOTAO 3####
func _on_Skill3_toggled(pressed):
	if(pressed):
		self.get_node("SkillsPanel/Control/Skill3/Sprite").set_self_opacity(0.5)
		selected_skills[button_skills[2].get_name()] = button_skills[2] 
	else:
		self.get_node("SkillsPanel/Control/Skill3/Sprite").set_self_opacity(1)
		selected_skills.erase(button_skills[2].get_name())

####BOTAO 4####
func _on_Skill4_toggled(pressed):
	if(pressed):
		self.get_node("SkillsPanel/Control/Skill4/Sprite").set_self_opacity(0.5)
		selected_skills[button_skills[3].get_name()] = button_skills[3] 
	else:
		self.get_node("SkillsPanel/Control/Skill4/Sprite").set_self_opacity(1)
		selected_skills.erase(button_skills[3].get_name())
		
func _on_SkillsNextButton_pressed():
	for key in (selected_skills).keys():											#coloca skill selecionadas na relação da proxima tela
		self.get_node("ConfirmPanel/ConfirmContainer/PlayerSkills/SkillList").add_text(key+"\n")
	changePanel("ConfirmPanel")

################################   CONFIRM

func _on_ConfirmBackButton_pressed():
	selected_skills.clear()
	self.reset_skill_buttons()
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerSkills/SkillList").clear()
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerSkills/SkillList").push_align(2)
	var path = SKILL_PATH+job+"/"
	dir_skills(path)
	changePanel("SkillsPanel")


func _on_RestartButton_pressed():
	Str = 0
	Agi = 0
	Int = 0
	Luk = 0
	job = null
	selected_skills.clear()
	button_skills.clear()
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerSkills/SkillList").clear()
	self.get_node("ConfirmPanel/ConfirmContainer/PlayerSkills/SkillList").push_align(2)
	self.reset_skill_buttons()
	changePanel("ClassPanel")

func reset_skill_buttons():
	#available_skills.clear()
	self.get_node("SkillsPanel/Control/Skill1/Sprite").set_texture(null)
	self.get_node("SkillsPanel/Control/Skill1/Sprite").set_self_opacity(1)
	self.get_node("SkillsPanel/Control/Skill1").set_pressed(false)
	self.get_node("SkillsPanel/Control/Skill2/Sprite").set_texture(null)
	self.get_node("SkillsPanel/Control/Skill2/Sprite").set_self_opacity(1)
	self.get_node("SkillsPanel/Control/Skill2").set_pressed(false)
	self.get_node("SkillsPanel/Control/Skill3/Sprite").set_texture(null)
	self.get_node("SkillsPanel/Control/Skill3/Sprite").set_self_opacity(1)
	self.get_node("SkillsPanel/Control/Skill3").set_pressed(false)
	self.get_node("SkillsPanel/Control/Skill4/Sprite").set_texture(null)
	self.get_node("SkillsPanel/Control/Skill4/Sprite").set_self_opacity(1)
	self.get_node("SkillsPanel/Control/Skill4").set_pressed(false)


func _on_ConfirmButton_pressed():
	self.get_node("ConfirmPanel/ConfirmContainer").hide()
	self.get_node("ConfirmPanel/ConfirmConnect").show()
	var all_skills = []
	for key in (selected_skills).keys():
		all_skills.append(selected_skills[key])
	global_obj.set_player([Str, Agi, Int, Luk], all_skills, self.job)
	self.set_process(true)




func _on_CancelButton_pressed():
	self.connect_status = ""
	self.get_node("ConfirmPanel/ConfirmConnect").hide()
	self.get_node("ConfirmPanel/ConfirmContainer").show()
	

	

