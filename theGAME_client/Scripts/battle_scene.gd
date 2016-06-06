extends Panel

var global_obj

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.get_node("DialoguePanel/VBoxContainer/AttackButton").grab_focus()
	self.get_node("DialoguePanel/VBoxContainer").set_pos(Vector2(680,2))
	self.get_node("DialoguePanel/VBoxContainer").set_alignment(1)
	self.set_process(true)
	self.set_process_input(true)

func _process(delta):
	pass

func _input(event):
	
	pass

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
	pass # replace with function body


func _on_SkillsButton_pressed():
	pass # replace with function body


func _on_DefendButton_pressed():
	pass # replace with function body


func _on_ItemsButton_pressed():
	pass # replace with function body


func _on_FleeButton_pressed():
	pass # replace with function body


