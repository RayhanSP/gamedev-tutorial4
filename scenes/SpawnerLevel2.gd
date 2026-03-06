extends Node2D

@export var obstacle: PackedScene

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child(spawned)
	
	spawned.global_position = self.global_position
	
	spawned.linear_velocity = Vector2(0, -1500)

func repeat():
	spawn()
	await get_tree().create_timer(3).timeout 
	repeat()
