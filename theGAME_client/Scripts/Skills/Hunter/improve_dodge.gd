extends "res://Scripts/Skills/buff_skills.gd"

var buff

func _init():
	self.set_jobs(["Hunter"])
	self.set_name("Improve Dodge")
	self.set_mana_cost(40)
	self.set_icon("res://Images/Improve_Dodge.tex")
	self.set_info("IMPROVE DODGE\nGain 2 AGI points for 3 turns.\nCost: 40 mana")

func call(player):
	buff = ("res://Scripts/Status/up_dodge.gd")
	buff.set_status(player, 3)
	player.add_buff(buff)
	pass

func _ready():
	pass