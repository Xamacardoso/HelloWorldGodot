extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -310.0
@onready var animated_sprite = $AnimatedSprite2D
@onready var player_label : Label = %PlayerLabel


func _ready():
	if Global.player_name:
		player_label.text = Global.player_name
	else:
		player_label.text = 'Player'
		
# Gets the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gets the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("mv_left", "mv_right")
	
	# Animations. If is on floor
	if is_on_floor():
		# Idle or movement animation
		if direction == 0:
			animated_sprite.play('idle')
		else:
			animated_sprite.play('run')
	else: # Animation for not on floor
		animated_sprite.play('jump')
	
	# Flips the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Apply movement based in a direction
	if direction:
		velocity.x = direction * SPEED * delta * 80
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
