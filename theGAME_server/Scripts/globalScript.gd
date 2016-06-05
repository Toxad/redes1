extends Node

var udp = PacketPeerUDP.new()

var listen_port = 1412

const remote_port = 1512

func _ready():
	pass

func start_connection():
	var err = udp.listen(listen_port)

func pack_ip():
	return udp.get_packet_ip()

func close_connection():
	udp.close()

func receive_packet():
	var packet = udp.get_var()
	return packet

func listening():
	return udp.is_listening()

func send(code, addr, msg):
	if (udp.is_listening()):
		udp.set_send_address(addr, remote_port)
		udp.put_var([code, msg])

func send_match(msg, player, adv):
	if(udp.is_listening()):
		udp.set_send_address(player[1], remote_port)
		udp.put_var(msg, player[0], player[1], adv[0], adv[1])
	pass

# send(8, user_b[1], user_a)