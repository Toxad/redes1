
extends Sprite

# numero de vezes que a conexão tentou com o servidor
var tries = 0 

# existe uma conexão pendente
var already_started = false 

# tempo ocorrido desde o inicio da conexão
var time = 0 

func _ready():
	var title = self.get_node("Title").add_text("theGAME")
	self.set_process(true)

# função que irá tentar conectar ao servidor um numero maximo de vezes (3) e, caso não conseguir, fechará o jogo
func _process(delta):
	if(already_started):
		time = time + delta
		if(time % 2 < 0):
			update_connecting_label()
		if(time > 10):
			if(tries < 3):
				tries = tries + 1
				time = 0
				already_started = false
			else:
				self.get_tree().quit()
		else:
			var recev = get_node("/root/globalNode")
			self.get_node("Label").set_text("Connected");
			self.set_process(false)
	else:
		already_started = true
		pass # enviar para o servidor


func update_connecting_label():
	var text = self.get_node("Label").get_text()
	if(text == "Connecting"):
		self.get_node("Label").set_text("Connecting.");
	elif(text == "Connecting."):
		self.get_node("Label").set_text("Connecting..");
	elif(text == "Connecting.."):
		self.get_node("Label").set_text("Connecting...");
	else:
		self.get_node("Label").set_text("Connecting");