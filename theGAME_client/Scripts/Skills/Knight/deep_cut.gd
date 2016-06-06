extends "res://Scripts/Skills/offensive_skills.gd"

var buff

func _init():
	self.set_jobs(["Knight"])
	self.set_name("Deep Cut")
	self.set_mana_cost(80)
	self.set_icon("res://Images/Deep_Cut.tex")
	self.set_info("Slashes the enemy causing them to bleed. Enemy loses 15 HP per turn for 4 turns.\nCost: 80 mana")

func call(player):
	buff = ("res://Scripts/Status/bleeding.gd")
	buff.set_status(player, 4)
	player.add_buff(buff)
	pass

func _ready():
	pass