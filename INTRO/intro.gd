extends Node2D


func _ready():
	$AnimationPlayer.play("Text")



func _on_touch_screen_button_pressed():
	get_tree().change_scene_to_file("res://pick_menu/pick_menu.tscn") # Replace with function body.
