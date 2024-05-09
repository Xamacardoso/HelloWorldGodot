extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	if body.is_in_group('player'):
		game_manager.add_coin()
		animation_player.play("pickup_animation")
