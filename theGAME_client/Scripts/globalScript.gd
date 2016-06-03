extends Node

var udp = PacketPeerUDP.new()

const listen_port = 1512

const remote_host = "localhost"

const remote_port = 1412

var playerName = ""

func set_player_name(name):
	self.playerName = name

func get_player_name():
	return self.playerName

func _ready():
	pass


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

func send(code):
	if (udp.is_listening()):
		var msg = [code, self.playerName, "Message", IP.resolve_hostname("localhost")]
		print(str("Sent ",msg))
		udp.put_var(msg)