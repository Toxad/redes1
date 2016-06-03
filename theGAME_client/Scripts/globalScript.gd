extends Node

var udp = PacketPeerUDP.new()

func _ready():
	#self.set_process(true)
	pass
	
#func _process(delta):
	
func start_connection(host_port, remote_ip, remote_port):
	var err = udp.listen(get_node("listen_port").get_val())
	if (err != OK):
		get_node("status").set_text("Error:\nCan't listen.")
		get_node("connect").set_pressed(false)
	else:
		get_node("status").set_text("Connected.")
		get_node("connect").set_text("Disconnect")
		err = udp.set_send_address(get_node("remote_host").get_text(),get_node("remote_port").get_val())
		if (err != OK):
			get_node("status").set_text("Error:\nCan't resolve.")
			get_node("connect").set_pressed(false)
		else:
			send_message("* " + get_node("user_name").get_text() + " entered chat.")
	
func close_connection():
	udp.close()
	
func receive():
	var packet = udp.get_var()
	return packet