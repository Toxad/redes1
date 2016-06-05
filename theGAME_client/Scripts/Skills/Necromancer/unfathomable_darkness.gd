extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Necromancer"])
	self.set_name("Unfathomable Darkness")
	self.set_target("enemy")
	self.set_damage_type("magical")
	self.set_mana_cost(100)
	#self.set_icon("")
	
func call(player):
	var dmg = 1.5*(player.get_magi_atk())
	self.set_damage(dmg)
	self.set_mana_cost(mana_cost)

