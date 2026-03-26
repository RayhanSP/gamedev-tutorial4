extends RigidBody2D

@export var sceneName = "Game Over"

func _on_FallArea_body_entered(body):
	if body.get_name() == "Player":
		Global.lives -= 1
		if Global.lives == 0:
			get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
		else:
			var current_scene = get_tree().get_current_scene().get_name()
			get_tree().call_deferred("change_scene_to_file", str("res://scenes/" + current_scene + ".tscn"))
	else:
		queue_free()
