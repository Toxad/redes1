extends status

func _ready():
	pass

func _init(player, turns).(player, turns):
	pass

func begin():
	self.get_target().set_strength(self.get_target().get_strength() - 2)

func step():
	pass

func end():
	self.get_target().set_strength(self.get_target().get_strength() + 2)