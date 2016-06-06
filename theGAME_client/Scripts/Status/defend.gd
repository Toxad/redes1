extends "res://Scripts/status.gd"

func begin():
	self.get_target().set_phys_def(self.get_target().get_phys_def() + 5)
	self.get_target().set_magic_def(self.get_target().get_magic_def() + 5)

func step():
	pass

func end():
	self.get_target().set_phys_def(self.get_target().get_phys_def() + 5)
	self.get_target().set_magic_def(self.get_target().get_magic_def() + 5)