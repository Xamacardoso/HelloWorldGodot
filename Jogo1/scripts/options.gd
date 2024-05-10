class_name Options_Menu
extends Control

@onready var back_button = %Back_to_Menu as Button
@onready var main_menu = get_parent()

signal exit_options_menu

func _ready():
	back_button.button_down.connect(on_back_pressed)
	back_button.button_down.connect(_on_back_to_menu_pressed)
	set_process(false)

func on_back_pressed():
	exit_options_menu.emit()
	set_process(true)
	print(back_button.button_pressed)


func _on_back_to_menu_button_down():
	print("Apertei o botão back.")
	print("Main Menu: %s" % [main_menu])
	main_menu.visible = true
	

func _on_back_to_menu_pressed():
	print("Apertei o botão back.")
	print("Main Menu: %s" % [main_menu])
	main_menu.visible = true
	exit_options_menu.emit()
