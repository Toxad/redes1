extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Mage"])
	self.set_name("Fireball")
	self.set_target("enemy")
	self.set_damage_type("magical")
	self.set_mana_cost(70)
	self.set_icon("res://Images/Fireball.tex")
	self.set_info("FIREBALL\nA simple spell any self-respecting Mage should know. 120% magic damage at the cost of 70 mana")
	
func call(player):
	var dmg = 1.2*(player.get_magic_atk())
	self.set_damage(dmg)
	self.set_mana_cost(mana_cost)

