extends Node2D

var direction_h = 1
const speed = 60
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D


func _process(delta):
	if ray_cast_left.is_colliding():
		direction_h *= -1
		animated_sprite.flip_h = not animated_sprite.flip_h  
	if ray_cast_right.is_colliding():
		direction_h *= -1
		animated_sprite.flip_h = not animated_sprite.flip_h
	
	position.x += speed *delta * direction_h
