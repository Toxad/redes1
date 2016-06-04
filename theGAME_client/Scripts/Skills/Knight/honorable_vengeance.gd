extends offensive_skills

func _init():
	self.set_jobs(["Knight"])
	self.set_name("Honorable Vengeance")
	self.set_target("enemy")
	self.set_damage_type("physical")
	self.set_mana_cost(70)
	#self.set_icon("")
	
func call(player):
	var dmg = player.get_phys_atk()+(player.get_phys_atk()/100)*20
	self.set_damage(dmg)
	self.set_hp_cost(hp_cost)
