extends Node2D

func _ready():
	$AnimationPlayer.play("fade_in")	
	await get_tree().create_timer(4).timeout
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://INTRO/intro.tscn")
	
