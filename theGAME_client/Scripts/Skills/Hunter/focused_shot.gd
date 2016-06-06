extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Hunter"])
	self.set_name("Focused Shot")
	self.set_target("enemy")
	self.set_damage_type("physical")
	self.set_mana_cost(50)
	self.set_icon("res://Images/Focused_Shot.tex")
	self.set_info("FOCUSED SHOT\nTakes the time to perfectly aim the arrow before firing. Deals 120% of physical damage at the cost of 50 mana.")
	
func call(dmg, target):
	self.set_damage(dmg)

func get_dmg(player):
	var dmg = 1.2*(player.get_phys_atk())
	return dmg

