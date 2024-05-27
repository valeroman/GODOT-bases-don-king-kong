extends CanvasLayer

const TILE_HEART_EMPTY = preload("res://assets/kenney/ui/tile_heart_empty.png")
const TILE_HEART_MORADO = preload("res://assets/kenney/ui/tile_heart_morado.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_controller_player_health_updated(new_player_health):
	$HBoxContainer/Corazon1.texture = TILE_HEART_MORADO if new_player_health >= 1 else TILE_HEART_EMPTY
	$HBoxContainer/Corazon2.texture = TILE_HEART_MORADO if new_player_health >= 2 else TILE_HEART_EMPTY
	$HBoxContainer/Corazon3.texture = TILE_HEART_MORADO if new_player_health >= 3 else TILE_HEART_EMPTY


func _on_game_controller_time_updated(seconds_left):
	$TextureRect/LabelTiempo.text = str(seconds_left)
