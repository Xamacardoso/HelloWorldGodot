extends Label

@onready var coin_counter = $"."


func _process(_delta):
	coin_counter.text = 'Coins: ' + str(%GameManager.coins)
	position = get_viewport_rect().position	
