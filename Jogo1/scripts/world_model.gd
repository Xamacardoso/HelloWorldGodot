class_name WorldModel
extends Node2D

@export var my_name : String

## When the world_model loads
func _ready():
	# If isn't playing any music, picks the music for the current world.
	if not Global.audio_stream_player.playing:
		Global.play_music_from_level(my_name)
		print('Playing music')
