class_name Personaje
extends CharacterBody2D

signal player_hit()

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

# Se crea al pisar Sprite2D y control y arrastramos hasta el script
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("izquierda", "derecha")
	
	#Obtener nodo de referencia
	# si dentro de la escena del script el nodo existe desde el principio (Personaje -> Sprite2D)
	if direction != 0:
		sprite_2d.scale.x = direction
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	print("Un cuerpo a entrado en el area: ", body.name )
	print("aqui podriamos reproducir una animacion de alegria")
	

func damage_received():
	print("daño recibido")
	player_hit.emit()
