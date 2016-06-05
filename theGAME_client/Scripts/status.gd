extends Node

var turn = 0
var target = null

func _init():
	pass

func set_status(player, turns):
	self.turn = turns
	self.target = player
	self.begin()

func _ready():
	pass

func get_target():
	return self.target

# atribui o valor inicial do debuff/buff
func set_turn(turn):
	self.turn = turn

# passa o turno para o debuff/buff
func pass_turn():
	self.turn = self.turn - 1
	pass

# checa se o debuff/buff esta ativo
func is_alive():
	if(turn == 0):
		self.end()
		return false
	return true

# será sobrescripto na classe filha
func begin():
	pass

# será sobrescripto na classe filha
func end():
	pass

# será sobrescripto na classe filha
func step():
	pass