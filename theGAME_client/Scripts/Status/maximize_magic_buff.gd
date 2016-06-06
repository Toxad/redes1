extends "res://Scripts/status.gd"

func begin():
	self.get_target().set_intelligence(self.get_target().get_intelligence() + 3)

func step():
	pass

func end():
	self.get_target().set_intelligence(self.get_target().get_intelligence() - 3)