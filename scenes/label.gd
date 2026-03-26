extends Label

func _process(delta: float) -> void:
	self.text = "LIVES: " + str(Global.lives)
