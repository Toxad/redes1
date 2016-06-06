extends Node

var udp = PacketPeerUDP.new()
const listen_port = 1512
const remote_host = "192.168.0.40"
const remote_port = 1412
var playerName = ""
var adversary_name = ""
var adversary_address = ""
var hero = null
var currentScene = null

func set_player_name(name):
	self.playerName = name

func get_player_name():
	return self.playerName

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)

func changeScene(local):
	currentScene.queue_free()
	var s = ResourceLoader.load(local)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)

func start_connection():
	print("Started Connection")
	var err = udp.listen(listen_port)
	if (err == OK):
		err = udp.set_send_address(remote_host, remote_port)

func close_connection():
	print("Connection closed")
	udp.close()

func receive_packet():
	var packet = udp.get_var()
	return packet

func listening():
	return udp.is_listening()

# manda codigo com uma mensagem
func send(code, msg):
	if (udp.is_listening()):
		udp.set_send_address(remote_host, remote_port)
		var packet = [code, self.playerName, msg]
		print(str("Sent ",packet))
		udp.put_var(packet)

# mensagem para o outro jogador quando você JA recebeu um pacote do servidor e espera a confirmação do outro
func send_match(code, adv):
	if(udp.is_listening()):
		udp.set_send_address(adv[1], listen_port)
		var packet = [code, playerName]
		udp.put_var(packet)

func send_battle(code, target, damage, status, type, classe):
	if(udp.is_listening()):
		udp.set_send_address(self.adversary_address, listen_port)
		var packet = [code, target, damage, status, type, classe]
		udp.put_var(packet)

func set_adversary(name, address):
	self.adversary_name = name
	self.adversary_address = address

func get_adversary():
	if(self.adversary_name == ""):
		return null
	return [self.adversary_name, self.adversary_address]

func set_player(attributes, skills, job):
	self.hero = get_node("/root/player")
	hero.set_player(playerName, attributes, skills, job)

func get_player():
	return self.hero

func pack_ip():
	return udp.get_packet_ip()