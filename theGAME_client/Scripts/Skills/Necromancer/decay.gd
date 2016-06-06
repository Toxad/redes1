extends "res://Scripts/Skills/offensive_skills.gd"

var buff

func _init():
	self.set_jobs(["Necromancer"])
	self.set_name("Decay")
	self.set_mana_cost(60)
	self.set_icon("res://Images/Decay.tex")
	self.set_info("DECAY\nWeakens the enemy, causing them to lose 1 STR per turn for 4 turns.\nCost: 60 mana")

func call(player):
	buff = ("res://Scripts/Status/weakness.gd")
	buff.set_status(player, 4)
	player.add_buff(buff)
	pass

func _ready():
	pass