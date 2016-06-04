extends Node

var name
var jobs = []
var target
var icon
var mana_cost = 0
var hp_cost = 0

func set_name(name):
	self.name = name

func get_name():
	return self.name

func set_jobs(jobs):
	self.jobs = jobs

func get_jobs():
	return self.jobs

func set_target(tar):
	self.target = tar

func get_target():
	return self.target

func set_icon(icon):
	self.icon = icon

func get_icon():
	return self.icon

func set_mana_cost(mana):
	self.mana_cost = mana

func get_mana_cost():
	return self.mana_cost

func set_hp_cost(hp):
	self.hp_cost = hp

func get_hp_cost(hp):
	return self.hp_cost
	


