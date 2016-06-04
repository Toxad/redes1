extends Node

var udp = PacketPeerUDP.new()

var listen_port = 1412

const remote_port = 1512

func _ready():
	pass

func start_connection():
	var err = udp.listen(listen_port)

func pack_ip():
	var got_ip = udp.get_packet_ip()
	return got_ip

func close_connection():
	udp.close()

func receive_packet():
	var packet = udp.get_var()
	return packet

func listening():
	return udp.is_listening()

func send(msg, addr):
	if (udp.is_listening()):
		udp.set_send_address(addr, remote_port)
		udp.put_var(msg)