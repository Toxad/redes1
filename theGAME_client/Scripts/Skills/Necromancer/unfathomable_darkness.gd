extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Necromancer"])
	self.set_name("Unfathomable Darkness")
	self.set_target("enemy")
	self.set_damage_type("magical")
	self.set_mana_cost(100)
	self.set_icon("res://Images/Unfathomable_Darkness.tex")
	self.set_info("UNFATHOMABLE DARKNESS\nSummon condensed shadows from below to feed on the enemy's soul. Deals 150% magic damage for 100 mana.")
	
func call(dmg, target):
	self.set_damage(dmg)
	
func get_dmg(player):
	var dmg = 1.5*(player.get_magic_atk())
	return dmg
