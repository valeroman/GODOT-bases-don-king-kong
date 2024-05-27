class_name Boss
extends Node2D

# Si el nodo no esta en la escena desde el principio y se crea durante el juego y queremos obtener su referencia
@onready var animation_player = $AnimationPlayer
const BARRIL = preload("res://enemigos/barril.tscn")

#func _ready():
	#Creo la señal manualmente
	#$Timer.connect("timeout", _on_timer_timeout())

func launch_barrel():
	var instancia_barril = BARRIL.instantiate()
	instancia_barril.position = $CharacterSquareRed/CharacterHandRed.position
	#instancia_barril.name = "barril_nuevo"
	add_child(instancia_barril)
	animation_player.play("reposo")
	
	# en otro lugar
	#var barril_que_crea = find_child("barril_nuevo")
	#var mi_barril = get_node("barril_nuevo")
	


func _on_timer_timeout():
	animation_player.play("lanzar")
	$Timer.wait_time = randf_range(2, 5)
	

# NOTA
# Usa referencia directa cuando hables con los nodo hijos
# Usa señales cuando hables con los padres o hermanos
