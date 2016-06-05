extends "res://Scripts/Skills/buff_skills.gd"

func _init():
	self.set_jobs(["Berserker"])
	self.set_name("Frenzy")
	self.set_mana_cost(50)
	self.set_icon("res://Images/Frenzy.tex")


func call(player):
	player.add_buff("res://Scripts/Skills/Berserker_buff/frenzy_buff.gd")
	pass

func _ready():
	pass