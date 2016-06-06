extends "res://Scripts/Skills/offensive_skills.gd"

func _init():
	self.set_jobs(["Rogue"])
	self.set_name("Double Attack")
	self.set_target("enemy")
	self.set_damage_type("physical")
	self.set_mana_cost(125)
	self.set_icon("res://Images/Double_Attack.tex")
	self.set_info("DOUBLE ATTACK\nStrikes the enemy twice before they can react. Deals 200% physical damage for 125 mana")
	
func call(dmg, target):
	self.set_damage(dmg)

func get_dmg(player):
	var dmg = 2*(player.get_phys_atk())
	return dmg