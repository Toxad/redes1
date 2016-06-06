extends "res://Scripts/status.gd"

var buff

func begin():
	self.get_target().set_life(self.get_target().get_life() - 15)

func step():
	self.get_target().set_life(self.get_target().get_life() - 15)

func end():
	self.get_target().set_life(self.get_target().get_life() - 15)
	pass