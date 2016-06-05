extends "res://Scripts/Skills/buff_skills.gd"

func _init():
	self.set_jobs(["Berserker"])
	self.set_name("Frenzy")
	self.set_mana_cost(50)
	self.set_icon("res://Images/Frenzy.tex")
	self.set_info("Gain 4 STR points for 4 turns at the cost of 20 HP per turn.")

func call(player):
	frenzy = ("res://Scripts/Status/frenzy_buff.gd")
	frenzy.set_status(player, 4)
	player.add_buff(frenzy)
	pass

func _ready():
	pass