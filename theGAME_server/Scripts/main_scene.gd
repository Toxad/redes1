extends Panel

var global_obj

var peers_numb = 0

func _ready():
	self.get_node("ListPanel").add_style_override("panel", get_stylebox("bg", "Tree"))
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.set_process(true)

func _process(delta):
	if(global_obj.listening()):
		var recev = global_obj.receive_packet()
		if(recev != null):
			print("Received something")
			if(recev[0] == 10):
				global_obj.send(15,recev[3])									#"ack" para cliente
				peers_numb = peers_numb + 1
				self.get_node("PeersNumber").set_text(str(peers_numb))			#atualiza numero de usuarios
				self.get_node("ListPanel/List").add_text(recev[1])				#adiciona nome de usuário à lista
				self.get_node("ListPanel/List").newline()
		else:
			return
	else:
		print("Listening now...")
		global_obj.start_connection()