extends Panel

var global_obj
var time = 0
var keep_alive = 0
var first_packet = true
var adv

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.get_node("DialoguePanel/VBoxContainer/AttackButton").grab_focus()
	self.get_node("DialoguePanel/VBoxContainer").set_pos(Vector2(680,2))
	self.get_node("DialoguePanel/VBoxContainer").set_alignment(1)
	self.set_process(true)
	self.set_process_input(true)
	self.adv = global_obj.get_adversary()
	self.get_node("VictoryLabel").hide()
	self.get_node("ReturnButton").hide()

func _process(delta):
	update_info()
	time = time + delta
	keep_alive = keep_alive + delta
	# send keep alive
	if(global_obj.listening()):
		if(time > 3):
			global_obj.send_match(32, adv)
			time = 0
		var packet = global_obj.receive_packet()
		if(global_obj.get_player().get_life() <= 0):
			global_obj.send_match(128, adv)
			lose()
		if(packet != null):
			# keep alive
			if(packet[0] == 32):
				first_packet = false
				keep_alive = 0
			# pacote de dano
			elif(packet[0] == 64):
				keep_alive = 0
				self.unlock()
				self.emulate_battle(packet)
			# vitoria!
			elif(packet[0] == 128):
				keep_alive = 0
				self.victory()
		else:
			if(keep_alive > 15):
				# não conseguiu entrar na batalha
				if(first_packet):
					global_obj.send_match(16, adv)
				# vitoria!
				else:
					self.victory()


func _input(event):
	if(event.type == InputEvent.KEY):
		if(event.scancode == KEY_LEFT):
			var button = self.get_node("DialoguePanel/VBoxContainer/SkillsButton")
			if(button.has_focus()):
				show_skills()
		elif(event.scancode == KEY_RIGHT):
			if(self.get_node("DialoguePanel/SkillsPanel").is_visible()):
				hide_skills()

func show_skills():
	self.get_node("DialoguePanel/SkillsPanel").show()
	self.get_node("DialoguePanel/SkillsPanel/VBoxContainer1/Skill1Button").grab_focus()
	self.get_node("DialoguePanel/VBoxContainer/AttackButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/DefendButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/FleeButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/ItemsButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/SkillsButton").set_disabled(true)
	var skills = global_obj.get_player().get_skills()
	index = 0
	for skill in skills:
		index = index + 1
		if(index == 1):
			self.get_node("DialoguePanel/SkillsPanel/VBoxContainer1/Skill1Button").set_text(skill.get_name())
			pass
		elif(index == 2):
			self.get_node("DialoguePanel/SkillsPanel/VBoxContainer1/Skill2Button").set_text(skill.get_name())
			pass
		elif(index == 3):
			self.get_node("DialoguePanel/SkillsPanel/VBoxContainer1/Skill3Button").set_text(skill.get_name())
			pass
		elif(index == 4):
			self.get_node("DialoguePanel/SkillsPanel/VBoxContainer1/Skill4Button").set_text(skill.get_name())
			pass
		elif(index == 5):
			self.get_node("DialoguePanel/SkillsPanel/VBoxContainer1/Skill5Button").set_text(skill.get_name())
			pass

func hide_skills():
	self.get_node("DialoguePanel/VBoxContainer/AttackButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/DefendButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/FleeButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/ItemsButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/SkillsButton").set_disabled(false)
	self.get_node("DialoguePanel/SkillsPanel").hide()
	self.get_node("DialoguePanel/VBoxContainer/SkillsButton").grab_focus()
	

############################### MENU PRINCIPAL

#FOCO NO BOTÃO#
func _on_AttackButton_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,20))

func _on_SkillsButton_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,56))
		
func _on_DefendButton_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,92))

func _on_ItemsButton_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,128))

func _on_FleeButton_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,164))

#FOCO NO BOTÃO(MOUSE)#
func _on_AttackButton_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,20))

func _on_SkillsButton_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,56))

func _on_DefendButton_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,92))

func _on_ItemsButton_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,128))

func _on_FleeButton_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(670,164))

# PRESSED BOTÃO

func _on_AttackButton_pressed():
	send_attack()
	lock()

func _on_SkillsButton_pressed():
	show_skills()

func _on_DefendButton_pressed():
	send_defend()
	lock()

func _on_ItemsButton_pressed():
	pass

func _on_FleeButton_pressed():
	send_forfeit()

############################### MENU SKILLS

#FOCO NO BOTÃO#
func _on_Skill1Button_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,20))

func _on_Skill2Button_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,56))

func _on_Skill3Button_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,92))

func _on_Skill4Button_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,128))

func _on_Skill5Button_focus_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,164))

#FOCO NO BOTÃO(MOUSE)#
func _on_Skill1Button_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,20))
	
func _on_Skill2Button_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,56))

func _on_Skill3Button_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,92))

func _on_Skill4Button_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,128))

func _on_Skill5Button_mouse_enter():
	if(not self.get_node("DialoguePanel/Pointer").is_visible()):
		self.get_node("DialoguePanel/Pointer").show()
	self.get_node("DialoguePanel/Pointer").set_pos(Vector2(450,164))

# PRESSED BOTÃO

func _on_Skill1Button_pressed():
	if(global_obj.get_player().get_skills().size() > 0):
		use_skill(1)
		lock()

func _on_Skill2Button_pressed():
	if(global_obj.get_player().get_skills().size() > 1):
		use_skill(2)
		lock()

func _on_Skill3Button_pressed():
	if(global_obj.get_player().get_skills().size() > 2):
		use_skill(3)
		lock()

func _on_Skill4Button_pressed():
	if(global_obj.get_player().get_skills().size() > 3):
		use_skill(4)
		lock()

func _on_Skill5Button_pressed():
	if(global_obj.get_player().get_skills().size() > 4):
		use_skill(5)
		lock()

##### Victory!

func _on_ReturnButton_pressed():
	global_obj.changeScene("res://Scenes/menu_scene.scn")
	pass # replace with function body

func update_info():
	var hero = global_obj.get_player()
	if(hero != null):
		self.get_node("DialoguePanel/InfoPanel/HPNumberLabel").set_text(str(hero.get_life(), "/", hero.get_max_life()))
		self.get_node("DialoguePanel/InfoPanel/ManaNumberLabel").set_text(str(hero.get_mana(), "/", hero.get_max_mana()))

func use_skill(skill_index):
	var target_skill = null
	var target = ""
	var index = 1
	print("Size de skills: " + str(global_obj.get_player().get_skills().size()) + "; index: " + str(skill_index))
	for skill in global_obj.get_player().get_skills():
		if(index == skill_index):
			target_skill = skill
		else:
			index = index + 1
	if(target_skill == null):
		print("skill não definida?")
		global_obj.send_battle(64, global_obj.get_player_name(), 0, "defend", "defend", global_obj.get_player().get_job())
		return
	print(target_skill)
	if(target_skill.get_ext() == "offensive_skills"):
		target_skill.set_damage(global_obj.get_player())
		print(str("Enviando ", 64, adv[0], target_skill.get_damage(), target_skill.get_name(), target_skill.get_damage_type(), global_obj.get_player().get_job()))
		global_obj.send_battle(64, adv[0], target_skill.get_damage(), target_skill.get_name(), target_skill.get_damage_type(), global_obj.get_player().get_job())
	elif(target_skill.get_ext() == "buff_skills"):
		print("usou call nele")
		target_skill.call(global_obj.get_player())
		print(str("Enviando ", 64, global_obj.get_player_name(), 0, target_skill.get_name(), "buff", global_obj.get_player().get_job()))
		global_obj.send_battle(64, global_obj.get_player_name(), 0, target_skill.get_name(), "buff", global_obj.get_player().get_job())

func emulate_battle(packet):
	print(packet)
	if(packet[4] == "buff" or packet[4] == "defend"):				# checa o tipo, se for um tipo que precisa ser usado, usa aqui
		print("tipo pass")
		return
	else:
		var hero = global_obj.get_player()
		if(packet[3] == "attack"):
			print("tipo ataque")
			hero.take_phys_damage(packet[2])						# toma dano fisico
		else:
			print("tipo skill")
			var skill = evaluate_skills(packet[3], packet[5])	# pega qual skill com base no nome packet[3]
			print(str("Evaluate skill: ", skill.get_name()))
			if(packet[4] == "physical"):
				skill.call(hero)						#seta dano físico
				hero.take_phys_damage(packet[2])				#calculo de dano
			elif(packet[4] == "magical"):
				skill.call(hero)						#seta dano magico
				hero.take_magic_damage(packet[2])				#calculo de dano
			pass
			
func evaluate_skills(name, job):
	var dir = Directory.new()
	if (dir.open("res://Scripts/Skills/"+job+"/") == OK):
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):							#percorre arquivos do diretório enquanto existem e na quantidade de skills disponíveis
			if(file_name != "." and file_name != ".."):		#ignora arquivos "falsos" retornados pela função
				file_name = file_name.split(".", false)		#separa nome do arquivo de sua extensão
				var skill = self.get_parent().get_node("/root/"+file_name[0])
				if (skill.get_name() == name):
					return skill
				file_name = dir.get_next()
			else:
				file_name = dir.get_next()

func victory():
	self.set_process(false)
	self.set_process_input(false)
	self.get_node("VictoryLabel").show()
	self.get_node("ReturnButton").show()
	self.get_node("AdversarySprite").hide()

func send_attack():
	var dmg = global_obj.get_player().get_phys_attack()*3
	global_obj.send_battle(64, adv[0], dmg, "attack", "physical", global_obj.get_player().get_job())
	pass

func send_defend():
	var hero = global_obj.get_player()
	var buff = ("res://Scripts/Status/defend.gd")
	buff.set_status(hero, 1)
	hero.add_buff(buff)
	global_obj.send_battle(64, hero.get_name(), 0, "defend", "defend", global_obj.get_player().get_job())

func send_forfeit():
	global_obj.send_match(128, adv)
	global_obj.changeScene("res://Scenes/menu_scene.scn")
	pass

func unlock():
	self.get_node("DialoguePanel/VBoxContainer/AttackButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/DefendButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/FleeButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/ItemsButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/SkillsButton").set_disabled(false)
	self.get_node("DialoguePanel/VBoxContainer/AttackButton").grab_focus()
	pass

func lock():
	self.get_node("DialoguePanel/SkillsPanel").hide()
	self.get_node("DialoguePanel/VBoxContainer/AttackButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/DefendButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/FleeButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/ItemsButton").set_disabled(true)
	self.get_node("DialoguePanel/VBoxContainer/SkillsButton").set_disabled(true)
	pass

func lose():
	self.set_process(false)
	self.set_process_input(false)
	self.get_node("VictoryLabel").show()
	self.get_node("VictoryLabel").set_text("Lose!")
	self.get_node("ReturnButton").show()
	self.get_node("PlayerSprite").hide()