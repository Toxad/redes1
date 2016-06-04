extends Node

var life = 0
var max_life = 0
var mana = 0
var name = ""
var magic_def = 0
var phys_def = 0

var attributes_dict = {"str": 0, "agi": 0, "int": 0, "luk": 0}

var skills_arr = []
var buffs_arr = []
var debuffs_arr = []

func _ready():
	pass

func _init(name, attributes, skills):
	self.name = name
	self.attributes_dict["str"] = attributes[0]
	self.attributes_dict["agi"] = attributes[1]
	self.attributes_dict["int"] = attributes[2]
	self.attributes_dict["luk"] = attributes[3]
	self.skills_arr = skills
	self.magic_def = randi() % 10
	self.phys_def = 10 - self.magic_def
	self.life = 500
	self.mana = 250

func get_skills():
	return self.skills_arr

func use_skill(target, index):
	var skill = skill_arr[index]
	if(isinstance(skill, offensive_skills)):
		skill.call(self, target)
	if(isinstance(skill, buff_skills)):
		skill.call(self)

func attack(target):
	target.take_damage()

func take_phys_damage(dmg):
	total = dmg - phys_def
	if(total < 0):
		total = 0
	self.life = self.life - 0

func take_magic_damage(dmg):
	total = dmg - magic_def
	if(total < 0):
		total = 0
	self.life = self.life - 0

func get_life():
	return self.life

func set_life(life):
	self.life = life

func get_mana():
	return self.mana

func set_mana(mana):
	self.mana = mana

func get_strength():
	return self.attributes_dict["str"]

func get_agility():
	return self.attributes_dict["agi"]

func get_intelligence():
	return self.attributes_dict["int"]

func get_luck():
	return self.attributes_dict["luk"]

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