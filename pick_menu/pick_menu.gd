extends Node2D





func _on_touch_screen_button_pressed():
	get_tree().quit() # Replace with function body.




func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://play_intro/play_intro.tscn")
