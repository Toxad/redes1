extends status

func _ready():
	pass

func _init(player, turns).(player, turns):
	pass

func begin():
	self.get_target().set_intelligence(self.get_target().get_intelligence() + 1)

func step():
	pass

func end():
	self.get_target().set_intelligence(self.get_target().get_intelligence() - 1)