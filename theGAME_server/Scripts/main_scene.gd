extends Panel

var global_obj

var peers_numb = 0
var connected_users = {}														#armazenamento de usuarios
var username
var useraddr

func _ready():
	self.get_node("ListPanel").add_style_override("panel", get_stylebox("bg", "Tree"))
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.set_process(true)

func _process(delta):
	if(global_obj.listening()):
		var recev = global_obj.receive_packet()									#recev[i] onde i: 0=autenticação; 1=nome; 2=mensagem; 3=endereço 
		if(recev != null):
			print("Received something")
			var ipo = global_obj.pack_ip()										#p pegar IP do pacote
			print(ipo)															
			if(recev[0] == 10):
				username = recev[1]
				useraddr = recev[3]
				global_obj.send(15,useraddr)									#"ack" para cliente
				peers_numb = peers_numb + 1
				self.get_node("PeersNumber").set_text(str(peers_numb))			#atualiza numero de usuarios
				self.get_node("ListPanel/List").add_text(username+"--"+useraddr+"\n")				#adiciona usuário ao display
				connected_users[useraddr] = username								#criação de novo usuário conectado
				print(connected_users)
		else:
			return
	else:
		print("Listening now...")
		global_obj.start_connection()
