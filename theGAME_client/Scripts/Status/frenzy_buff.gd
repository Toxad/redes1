extends "res://Scripts/status.gd"

func begin():
	self.get_target().set_strength(self.get_target().get_strength() + 4)

func step():
	self.get_target().set_life(self.target.get_life()-15)

func end():
	self.get_target().set_strength(self.get_target().get_strength() - 4)
