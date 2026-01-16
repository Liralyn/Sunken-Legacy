extends Node2D

@export var Heart1 : Texture2D
@export var Heart0 : Texture2D

@onready var Heart_1 = $Heart1
@onready var Heart_3 = $Heart3
@onready var Heart_2 = $Heart2

func _ready():
	HealthManager.on_health_change.connect(on_player_health_changed)
	
func on_player_health_changed(player_current_health : int): 
	if player_current_health == 3:
		Heart_3.texture = Heart1
	elif player_current_health < 3:
		Heart_3.texture = Heart0
		
	if player_current_health == 2:
		Heart_2.texture = Heart1
	elif player_current_health < 2:
		Heart_2.texture = Heart0
		
	if player_current_health == 1:
		Heart_1.texture = Heart1
	elif player_current_health < 1:
		Heart_1.texture = Heart0
