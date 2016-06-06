extends "res://Scripts/Skills/offensive_skills.gd"

var buff

func _init():
	self.set_jobs(["Rogue"])
	self.set_name("Poisoned Blade")
	self.set_mana_cost(80)
	self.set_icon("res://Images/Poisoned_Blade.tex")
	self.set_info("POISONED BLADE\nStrikes enemy with a poisoned weapon. Target loses 10 HP per turn for 3 turns and STR is lowered by 2 for the duration. Cost: 80 mana")

func call(player):
	buff = ("res://Scripts/Status/poison.gd")
	buff.set_status(player, 3)
	player.add_buff(buff)
	pass

func _ready():
	pass