extends "res://Scripts/status.gd"

var original_str

func begin():
	original_str = self.get_target().get_strength()
	self.get_target().set_strength(self.get_target().get_strength() - 1)

func step():
	self.get_target().set_strength(self.get_target().get_strength() - 1)
	pass

func end():
	self.get_target().set_strength(original_str)