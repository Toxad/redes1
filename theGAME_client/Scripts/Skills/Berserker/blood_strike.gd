extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Berserker"])
	self.set_name("Blood Strike")
	self.set_target("enemy")
	self.set_damage_type("physical")
	self.set_icon("res://Images/Blood_Strike.tex")
	self.set_info("Attacks enemy player with 100% of physical attack + 15% of HP value at the cost of the same amount of HP.\nHP Cost: 15% of total HP")

func call(player):
	var hp_cost = (player.get_max_life()/100)*15
	var dmg = (hp_cost)+player.get_phys_atk()				#15% do HP + atk físico
	self.set_damage(dmg)
	self.set_hp_cost(hp_cost)

func get_icon():
	return self.icon