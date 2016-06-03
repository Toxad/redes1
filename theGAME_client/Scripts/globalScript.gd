extends Node

var udp = PacketPeerUDP.new()

var listen_port = 1512

const remote_host = "111.111.111.111"

const remote_port = 1412

func _ready():
	pass

func start_connection():
	var err = udp.listen(listen_port)
	if (err == OK):
		err = udp.set_send_address(remote_host, remote_port)
		
	
func close_connection():
	udp.close()
	
func receive_packet():
	var packet = udp.get_var()
	return packet
	
func listening():
	return udp.is_listening()
	
func send(msg):
	if (udp.is_listening()):
		udp.put_var(msg)