extends CharacterBody2D

class_name Enemy

var speed = 130
var player = null
var in_range = false

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	in_range = false  # Inicializa in_range a false

func _physics_process(delta: float) -> void:
	if in_range and player != null:
		var direction = position.direction_to(player.global_position)
		velocity = direction * speed
		look_at(player.global_position)
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body == player:
		in_range = true


func _on_area_2d_body_exited(body):
	if body == player:
		in_range = false
