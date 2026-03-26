extends LinkButton

func _on_pressed():
	# Reset nyawa ke kondisi awal sebelum pindah scene
	Global.lives = 3 
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
