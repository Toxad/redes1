extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Knight"])
	self.set_name("Honorable Vengeance")
	self.set_target("enemy")
	self.set_damage_type("physical")
	self.set_mana_cost(70)
	self.set_icon("res://Images/Honor_Strike.tex")
	self.set_info("HONORABLE VENGEANCE\nChannel your sense of duty into your blade. Deals 130% physical damage at the cost of 70 mana")
	
func call(dmg, target):
	self.set_damage(dmg)

func get_dmg(player):
	var dmg = 1.3*(player.get_phys_atk())
	return dmg
