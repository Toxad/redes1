extends Sprite

# numero de vezes que a conexão tentou com o servidor
var tries = 0

# existe uma conexão pendente
var already_started = false

# tempo ocorrido desde o inicio da conexão
var time = 0

# global object
var global_obj

# mudar de cena
var change_scene = false

func _ready():
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.get_node("Label").hide()
	self.set_process_input(true)
	
func _input(event):
	if(event.is_action_pressed("ENTER")):
		require_server()
		self.get_tree().set_input_as_handled()

func require_server():
	var name = self.get_node("Panel/VBoxContainer/HBoxContainer/NameLineEdit").get_text()
	if(not name.empty()):
		global_obj.set_player_name(name)
		global_obj.start_connection()
		self.get_node("Panel").hide()
		self.get_node("Label").show()
		self.get_node("Label/Timer").start()
		self.set_process(true)
		self.set_process_input(false)
	else:
		print("Campo vazio")
	

# função que irá tentar conectar ao servidor um numero maximo de vezes (3) e, caso não conseguir, fechará o jogo
func _process(delta):
	if(already_started and (not change_scene)):
		time = time + delta
		if(time > 5):
			if(tries < 5):
				tries = tries + 1
				time = 0
				already_started = false
			else:
				self.stop("It was not possible to connect")
				self.set_process(false)
		else:
			if(global_obj.listening()):
				var recev = global_obj.receive_packet()
				if(recev == null):
					return
				if(recev and recev == 4):
					stop("Connected")
					change_scene = true
					time = 0
				else:
					print("ERROR: Bad ACK: ", recev)
			else:
				self.stop("A Problem occured")
				self.set_process(false)
	elif(change_scene):
		time = time + delta
		print(time)
		if(time > 2):
			global_obj.changeScene("res://Scenes/menu_scene.scn")
	else:
		already_started = true
		global_obj.send(4, "Connection Request")

func update_label():
	var text = self.get_node("Label").get_text()
	if(text != "Connecting..."):
		self.get_node("Label").set_text(str(self.get_node("Label").get_text(), "."))
	else:
		self.get_node("Label").set_text("Connecting")

func _on_Timer_timeout():
	update_label()

func stop(text):
	self.get_node("Label/Timer").stop()
	self.get_node("Label").set_text(text)

func _on_Button_pressed():
	require_server()
