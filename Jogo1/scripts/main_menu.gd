class_name MainMenu

extends Control

@export var my_name : String

@onready var main_menu_container = $MarginContainer
@onready var name_edit : LineEdit = %Name_Edit

@export var new_game_button  : Button
@export var load_game_button : Button
@export var options_button : Button
@onready var options_menu = $Options_Menu as Options_Menu
@export var exit_button : Button

# By default, the new_game button has focus
func _ready():
	options_menu.visible = false
	handle_connecting_signals()
	# If isn't playing any music, picks the music for the main menu.
	if not Global.audio_stream_player.playing:
		Global.play_music_from_level(my_name)
		print('Playing music')


# Changes the button indicator according to the focus
func _process(delta):
	change_button_indicator()
	
func change_button_indicator():
	pass



## New Game
func on_new_game_pressed():
	save_player_name()
	Global.stop_music()
	get_tree().change_scene_to_file("res://scenes/world1.tscn")

func save_player_name():
	Global.player_name = name_edit.text

## Load game
func on_load_game_pressed():
	save_player_name()
	Global.stop_music()
	Global.load_game()
	print(Global.userdata['last_level'])
	get_tree().change_scene_to_file(Global.userdata['last_level'])

## Options
func on_options_button_pressed():
	print("Abrindo menu de opções.")
	main_menu_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true
	name_edit.visible = false

func on_exit_options_menu():
	print("Saindo do menu de opções.")
	options_menu.visible = false
	main_menu_container.visible = true
	name_edit.visible = true

## Quit game
func on_exit_pressed():
	get_tree().quit()

func handle_connecting_signals():
	new_game_button.button_down.connect(on_new_game_pressed)
	load_game_button.button_down.connect(on_load_game_pressed)
	options_button.button_down.connect(on_options_button_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)

func _exit_tree():
	Global.save_game()
	
