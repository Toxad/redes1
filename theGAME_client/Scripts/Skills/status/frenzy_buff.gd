extends "res://Scripts/status.gd"

var original_str

func _ready():
	pass

func begin():
	original_str = self.target.get_strength()
	self.target.set_strength(original_str+4)

func step():
	self.target.set_life(self.target.get_life()-20)

func end():
	self.target.set_strength(original_str)
