extends "res://Scripts/Skills/buff_skills.gd"

var buff

func _init():
	self.set_jobs(["Mage"])
	self.set_name("Maximize Magic")
	self.set_mana_cost(50)
	self.set_icon("res://Images/Maximize_Magic.tex")
	self.set_info("Gain 3 STR points for 3 turns.\nCost: 50 mana")

func call(player):
	buff = ("res://Scripts/Status/maximize_magic.gd")
	buff.set_status(player, 3)
	player.add_buff(buff)
	pass

func _ready():
	pass