extends "res://Scripts/Skills/offensive_skills.gd"

var buff

func _init():
	self.set_jobs(["Rogue"])
	self.set_name("Poisoned Blade")
	self.set_mana_cost(80)
	self.set_icon("res://Images/Poisoned_Blade.tex")
	self.set_info("Strikes the enemy with a poisoned weapon. Causes them to lose 10 HP per turn for 3 turns and lowers STR by 2 for the duration\nCost: 80 mana")

func call(player):
	buff = ("res://Scripts/Status/poison.gd")
	buff.set_status(player, 3)
	player.add_buff(buff)
	pass

func _ready():
	pass