extends Area2D

@export var sceneName: String = "Level1"

func _on_Area_Trigger_body_entered(body):
	if body.get_name() == "Player":
		var current_scene = get_tree().get_current_scene().get_name()
		
		if current_scene == sceneName:
			Global.lives -= 1
			if Global.lives == 0:
				get_tree().change_scene_to_file("res://scenes/Game Over.tscn")
			else:
				get_tree().call_deferred("change_scene_to_file", str("res://scenes/" + sceneName + ".tscn"))
		
		else:
			get_tree().call_deferred("change_scene_to_file", str("res://scenes/" + sceneName + ".tscn"))
