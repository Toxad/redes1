extends "res://Scripts/status.gd"

func begin():
	self.get_target().set_life(self.get_target().get_life() - 10)
	self.get_target().set_strength(self.get_target().get_strength() - 2)
func step():
	self.get_target().set_life(self.get_target().get_life() - 10)

func end():
	self.get_target().set_life(self.get_target().get_life() - 10)
	self.get_target().set_strength(self.get_target().get_strength() + 2)

