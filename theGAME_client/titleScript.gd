
extends Sprite

# numero de vezes que a conexão tentou com o servidor
var tries = 0 

# existe uma conexão pendente
var already_started = false 

# tempo ocorrido desde o inicio da conexão
var time = 0

# global object
var global_obj

func _ready():
	var title = self.get_node("Title").add_text("theGAME")
	global_obj = self.get_parent().get_node("/root/globalNode")
	global_obj.start_connection()
	self.set_process(true)

# função que irá tentar conectar ao servidor um numero maximo de vezes (3) e, caso não conseguir, fechará o jogo
func _process(delta):
	if(already_started):
		time = time + delta
		if(time > 5):
			if(tries < 3):
				tries = tries + 1
				time = 0
				already_started = false
			else:
				# self.get_tree().quit()
				self.stop("It was not possible to connect")
		else:
			if(global_obj.listening()):
				var recev = global_obj.receive_packet()
				if(recev == null):
					return
				self.stop("Connected")
			else:
				self.stop("A Problem occured")
	else:
		already_started = true
		global_obj.send([10,"Usuario", "Mensagem"])

func update_label():
	var text = self.get_node("Label").get_text()
	if(text == "Connecting"):
		self.get_node("Label").set_text("Connecting.")
	elif(text == "Connecting."):
		self.get_node("Label").set_text("Connecting..")
	elif(text == "Connecting.."):
		self.get_node("Label").set_text("Connecting...")
	else:
		self.get_node("Label").set_text("Connecting")

func _on_Timer_timeout():
	update_label()

func stop(text):
	self.get_node("Label").set_text(text)
	self.get_node("Label/Timer").stop()
	self.set_process(false)