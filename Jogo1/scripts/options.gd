class_name Options_Menu
extends Control

@onready var back_button = $MarginContainer/Options/Back_to_Menu as Button
@onready var main_menu = get_parent().get_node("MarginContainer")

signal exit_options_menu

func _ready():
	back_button.button_down.connect(on_back_pressed)
	set_process(false)

func on_back_pressed():
	exit_options_menu.emit()
	set_process(true)
