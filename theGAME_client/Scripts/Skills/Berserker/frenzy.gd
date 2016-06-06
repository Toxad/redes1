extends "res://Scripts/Skills/buff_skills.gd"

var buff

func _init():
	self.set_jobs(["Berserker"])
	self.set_name("Frenzy")
	self.set_mana_cost(50)
	self.set_icon("res://Images/Frenzy.tex")
	self.set_info("FRENZY\nGain 4 STR points for 4 turns at the cost of 20 HP per turn.")

func call(player):
	buff = ("res://Scripts/Status/frenzy_buff.gd")
	buff.set_status(player, 4)
	player.add_buff(buff)
	pass

func _ready():
	pass