extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Mage"])
	self.set_name("Fireball")
	self.set_target("enemy")
	self.set_damage_type("magical")
	self.set_mana_cost(70)
	#self.set_icon("")
	
func call(player):
	var dmg = 1.2*(player.get_magi_atk())
	self.set_damage(dmg)
	self.set_mana_cost(mana_cost)

