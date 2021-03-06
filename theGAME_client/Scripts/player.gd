extends Node

var life = 0
var max_life = 0
var max_mana = 0
var mana = 0
var name = ""
var magic_def = 0
var phys_def = 0
var job = ""

var attributes_dict = {"str": 0, "agi": 0, "int": 0, "luk": 0}

var skills_arr = []
var buffs_arr = []
var debuffs_arr = []

func _ready():
	pass

func _init():
	pass

func get_job():
	return self.job
	
func set_player(name, attributes, skills, job):
	self.name = name
	self.attributes_dict["str"] = attributes[0]
	self.attributes_dict["agi"] = attributes[1]
	self.attributes_dict["int"] = attributes[2]
	var val = 0
	for i in range(attributes[3]):
		if(val == 0):
			self.set_strength(self.get_strength() + 1)
			val = val + 1
		elif(val == 1):
			self.set_agility(self.get_agility() + 1)
			val = val + 1
		elif(val == 2):
			self.set_intelligence(self.get_intelligence() + 1)
			val = 0
	self.skills_arr = skills
	self.magic_def = randi() % 10
	self.phys_def = 10 - self.magic_def
	self.life = 500
	self.mana = 250
	self.job = job
	self.max_life = self.life
	self.max_mana = self.mana

func get_skills():
	return self.skills_arr

func set_phys_def(val):
	self.phys_def = val

func get_phys_def():
	return self.phys_def

func get_magic_def():
	return self.magic_def

func set_magic_def(val):
	self.magic_def = val

func take_phys_damage(dmg):
	var total = 0
	if(dmg > self.phys_def):
		total = int(dmg) - self.phys_def
	self.life = self.life - total
	if(self.life < 0):
		self.life = 0
	print("life: " + str(self.life) + "; damage: " + str(dmg))

func take_magic_damage(dmg):
	var total = 0
	if(dmg > self.magic_def):
		total = int(dmg) - self.magic_def
	self.life = self.life - total
	if(self.life < 0):
		self.life = 0
	print("life: " + str(self.life) + "; damage: " + str(dmg))

func get_life():
	return self.life

func set_life(life):
	self.life = life

func get_max_life():
	return self.max_life

func get_max_mana():
	return self.max_mana

func get_mana():
	return self.mana

func set_mana(mana):
	self.mana = mana

func get_strength():
	return self.attributes_dict["str"]

func set_strength(val):
	self.attributes_dict["str"] = val

func get_agility():
	return self.attributes_dict["agi"]

func set_agility(val):
	self.attributes_dict["agi"] = val

func get_intelligence():
	return self.attributes_dict["int"]

func set_intelligence(val):
	self.attributes_dict["int"] = val

func get_luck():
	return self.attributes_dict["luk"]

func set_luck(val):
	self.attributes_dict["luk"] = val

func get_phys_attack():
	return self.get_strength() * 3

func get_magic_attack():
	return self.get_intelligence() * 4
	pass

func get_critical_melee():
	var total = 0
	var val = self.get_strength()
	while(val >= 3):
		total = total + 5
		val = val - 3
	val = self.get_agility()
	while(val >= 6):
		total = total + 5
		val = val - 6
	return total

func get_critical_ranged():
	var total = 0
	var val = self.get_agility()
	while(val >= 3):
		total = total + 5
		val = val - 3
	val = self.get_strength()
	while(val >= 6):
		total = total + 5
		val = val - 6
	return total

func get_critical_magic():
	var total = 0
	var val = self.get_intelligence()
	while(val >= 4):
		total = total + 5
		val = val - 4
	return total

func get_dodge():
	var total = 0
	var val = self.get_agility()
	while(val >= 2):
		total = total + 5
		val = val - 2
	val = self.get_intelligence()
	while(val >= 3):
		total = total + 2
		val = val - 3
	return total

	
func pass_turn_status():
	var to_remove = []
	# passa um turno dos buffs
	for buff in buffs_arr:
		buff.pass_turn(self)
		if(not buff.is_alive()):
			to_remove.append(buff)
	for rm in to_remove:
		buffs_arr.remove(rm)
	to_remove = []
	# passa um turno dos debuffs
	for debuff in debuffs_arr:
		debuff.pass_turn(self)
		if(not debuff.is_alive()):
			to_remove.append(debuff)
	for rm in to_remove:
		debuffs_arr.remove(rm)

func add_buff(buff):
	self.buffs_arr.append(buff)

func add_debuff(debuff):
	self.debuffs_arr.append(debuff)