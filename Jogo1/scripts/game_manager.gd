extends Node

var coins = 0


@onready var LevelCoin = $"../CoinCounterLevel"


func add_coin(): # Add a coin to the counter
	coins +=1
	if coins == 20:
		LevelCoin.text = 'CONGRATULATIONS!!! You\'ve collected all coins!' # Updates the count of coins in the final section of the level
	
