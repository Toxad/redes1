extends "skills.gd"

var damage_type
var damage

func _init():
	self.set_ext("offensive_skills")

func set_damage_type(type):
	self.damage_type = type

func get_damage_type():
	return self.damage_type

func set_damage(dmg):
	self.damage = dmg

func get_damage():
	return self.damage
