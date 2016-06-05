extends "res://Scripts/Skills/buff_skills.gd"

func _init():
	self.set_jobs(["Berserker"])
	self.set_name("Frenzy")
	self.set_mana_cost(50)
	self.set_icon("res://Images/Frenzy.tex")


func call(player):
	frenzy = ("res://Scripts/Skills/status/frenzy_buff.gd")
	frenzy.set_status(player, 4)
	player.add_buff(frenzy)
	pass

func _ready():
	pass