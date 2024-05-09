extends Node

@onready var audio_stream_player : AudioStreamPlayer = $AudioStreamPlayer

var player_name := String()

func _ready() -> void:
	save_game()

## User save data
var userdata := {
'coin_count' : 0,
'last_level' : 'res://scenes/world3.tscn'
}

## Saves the game
func save_game():
	var save_file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	save_file.store_string(JSON.stringify(userdata))

## Loads the game
func load_game():
	var save_file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	if save_file == null:
		print('No files saved.')
		return
		
	var content = save_file.get_as_text() 
	var _json_text = JSON.parse_string(content) as Dictionary
	userdata = _json_text
	print('File loaded.')
	

## All levels, its music, its name and scene file path
var levels := {
	'main_menu' : {
		'name' : 'world1',
		'music' : preload("res://assets/music/Metallica - The Day That Never Comes 8-bit (128 kbps)CUT.mp3"),
		'scene' : preload("res://scenes/main_menu.tscn"),
	},
	'world1' : {
		'name' : 'world1',
		'music' : preload("res://assets/music/Wherever I May Roam 8-Bit (192 kbps).mp3"),
		'scene' : preload("res://scenes/world1.tscn"),
	},
	'world2' : {
		'name' : 'world2',
		'music' : preload("res://assets/music/King Nothing 8-Bit (192 kbps)CUT.mp3"),
		'scene' : preload("res://scenes/world2.tscn"),
	},
	'world3' : {
		'name' : 'world3',
		'music' : preload("res://assets/music/Sad But True 8-Bit (192 kbps)CUT.mp3"),
		'scene' : preload("res://scenes/world3.tscn"),
	}
}

## Tries to get the level music and calls the play_music method
func play_music_from_level(level_key) -> void:
	var music = get_music_from_level(level_key)
	play_music(music)

## Gets the music that is in the level registered on the dictionary
func get_music_from_level(level_key):
	var level = levels[level_key]
	var music = level['music']
	return music

## Changes the music for the audiostreamplayer and plays it
func play_music(music) -> void:
	audio_stream_player.stream = music
	audio_stream_player.play()

## Stops any music playing
func stop_music() -> void:
	audio_stream_player.stop()

