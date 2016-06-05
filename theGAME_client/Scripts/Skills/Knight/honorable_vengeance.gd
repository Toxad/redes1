extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Knight"])
	self.set_name("Honorable Vengeance")
	self.set_target("enemy")
	self.set_damage_type("physical")
	self.set_mana_cost(70)
	#self.set_icon("")
	
func call(player):
	var dmg = 1.3*(player.get_phys_atk())
	self.set_damage(dmg)
	self.set_hp_cost(hp_cost)
