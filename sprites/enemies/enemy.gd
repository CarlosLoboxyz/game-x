extends CharacterBody2D

@export var player: CharacterBody2D
@export var speed = 150

func _physics_process(delta):
	position = lerp(global_position,player.global_position,delta)
	look_at(player.global_position)
