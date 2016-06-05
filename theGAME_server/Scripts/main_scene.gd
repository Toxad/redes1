extends Panel

var global_obj

var peers_numb = 0
var users = [] # armazenamento de usuarios
var username
var time
var list

func _ready():
	list = get_node("ListPanel/List")
	time = 0
	self.get_node("ListPanel").add_style_override("panel", get_stylebox("bg", "Tree"))
	global_obj = self.get_parent().get_node("/root/globalNode")
	self.set_process(true)

func _process(delta):
	time = time + delta
	if(global_obj.listening()):
		var recev = global_obj.receive_packet() # recev[i] onde i: 0 = autenticação; 1 = nome; 2 = mensagem;
		if(recev != null):
			var address = global_obj.pack_ip()
			# reconhecimento que o servidor esta ativo
			if(recev[0] == 4):
				print_packet(recev)
				global_obj.send(4, address, "Ok")
			# finding match
			elif(recev[0] == 8):
				print_packet(recev)
				username = recev[1]
				var unique = true
				for user in users:
					if(username == user[0]):
						unique = false
					if(address == user[1]):
						return
				if(unique):
					var obj = [username, address]
					users.append(obj)
					print(users)
					peers_numb = peers_numb + 1
					update()
				else:
					send(0, address, "Duplicated name")
			# confirmação de que chegou mensagem de match; retira da lista os 2 se o que enviou estiver no topo
			elif(recev[0] == 16):
				print_packet(recev)
				var user_a = users[0]
				var user_b = users[1]
				if(address == user_a[1] or address == user_b[1] > users.size() > 2):
					send(16, user_a[1], "Ok")
					send(16, user_b[1], "Ok")
					peers_numb = peers_numb - 2
					users.remove(0)
					users.remove(1)
					update_list()
			else:
				return
		else:
			if(users.size() > 1 && time > 0.5):
				time = 0
				var user_a = users[0]
				var user_b = users[1]
				# manda pra user_a seu oponente e ele mesmo
				send_match(8, user_a, user_b)
				# manda pra user_b seu oponente e ele mesmo
				send_match(8, user_b, user_a)
			return
	else:
		print("Listening now...")
		global_obj.start_connection()

func update():
	get_node("PeersNumber").set_text(str(peers_numb))
	list.clear()
	print(users.size())
	for index in range(users.size()):
		var user = users[index]
		list.add_text(str("\n", user[0], "\t", user[1]))

func print_packet(msg):
	print(str(msg[0], ": ", msg[1], ": ", msg[2]))
