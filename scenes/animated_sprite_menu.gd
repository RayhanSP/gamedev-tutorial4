extends AnimatedSprite2D

var speed = 150.0
var velocity_y = 0.0
var floor_y = 0.0

const GRAVITY = 900.0
const JUMP_FORCE = -400.0

var action_timer = 0.0
var current_state = "walk"
var last_state = ""

func _ready():
	floor_y = position.y
	pick_new_action()

func _process(delta):
	if current_state == "walk":
		position.x += speed * delta
	elif current_state == "jump":
		position.x += (speed * 0.7) * delta
		
		velocity_y += GRAVITY * delta
		position.y += velocity_y * delta
		
		if position.y >= floor_y:
			position.y = floor_y
			velocity_y = 0.0
			pick_new_action()

	if position.x > get_viewport_rect().size.x + 50:
		position.x = -50

	if current_state != "jump":
		action_timer -= delta
		if action_timer <= 0:
			pick_new_action()

func pick_new_action():
	if last_state == "jump":
		current_state = "walk"
		last_state = "walk"
		play("walk")
		action_timer = randf_range(2.0, 3.0)
		return
		
	var available_actions = ["walk", "stand", "jump"]
	var rand_action = available_actions[randi() % available_actions.size()]
	
	if rand_action == "walk":
		current_state = "walk"
		last_state = "walk"
		play("walk")
		action_timer = randf_range(2.0, 3.0)
	elif rand_action == "stand":
		current_state = "stand"
		last_state = "stand"
		play("stand")
		action_timer = randf_range(0.5, 1.5)
	else:
		current_state = "jump"
		last_state = "jump"
		play("jump")
		velocity_y = JUMP_FORCE
