extends status

func _ready():
	pass

func _init(player, turns).(player, turns):
	pass

func begin():
	self.get_target().set_life(self.get_target().get_life() - 5)

func step():
	self.get_target().set_life(self.get_target().get_life() - 5)

func end():
	pass