extends LinkButton

func _on_pressed():
	# Memastikan nyawa penuh jika sebelumnya pemain sempat mati
	Global.lives = 3
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
