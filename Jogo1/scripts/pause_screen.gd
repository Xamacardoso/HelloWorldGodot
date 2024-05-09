extends CanvasLayer

@onready var screensNode = get_node("Screens");
@onready var pause_container : Control = screensNode.get_node("Pause_Container")
@onready var options_menu : Control = screensNode.get_node("Options_Menu")

@onready var resume : Button = $Screens/Pause_Container/Resume
@onready var options_menu_back : Button = $Screens/Options_Menu/MarginContainer/Options/Back_to_Menu


func _ready() -> void:
	visible = false
	options_menu.visible = false
	
	# Conectar sinal de retorno do menu de opções
	options_menu_back.button_down.connect(_backToPauseMenu)
	
func _backToPauseMenu():
	# Tornar todas as telas invisíveis, exceto a principal.
	for screen in screensNode.get_children():
		screen.visible = (screen == pause_container)
	

func _unhandled_input(event) -> void:
	if event.is_action_pressed("pause_back"):
			visible = true
			get_tree().paused = true
			resume.grab_focus()
			options_menu.visible = false
			
## On resume button pressed
func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false

## On options button pressed
func _on_options_pressed() -> void:
	pause_container.visible = false
	options_menu.visible = true
	
## On main menu button pressed
func _on_main_menu_pressed() -> void:
	pass # Replace with function body.
