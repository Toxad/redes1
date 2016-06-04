extends offensive_skills

func _init():
	self.set_jobs(["Berserker"])
	self.set_name("Blood Strike")
	self.set_target("enemy")
	self.set_damage_type("physical")
	#self.set_icon("")
	
func call(player):
	var hp_cost = (player.get_max_life()/100)*15
	var dmg = (hp_cost)+player.get_phys_atk()				#15% do HP + atk físico
	self.set_damage(dmg)
	self.set_hp_cost(hp_cost)
	
