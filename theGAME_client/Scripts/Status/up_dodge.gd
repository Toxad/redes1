extends "res://Scripts/status.gd"

func begin():
	self.get_target().set_agility(self.get_target().get_agility() + 2)

func step():
	pass

func end():
	self.get_target().set_agility(self.get_target().get_agility() - 2)