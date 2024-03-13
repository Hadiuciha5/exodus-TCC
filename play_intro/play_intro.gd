extends Node2D

@onready var overlay := %FadeOverlay
@onready var return_button := %kembali

func _ready():
	overlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)
	return_button.pressed.connect(_on_kembali_released)
	
	overlay.visible = true
	MusicControl.stop_muusic()


func _on_fade_overlay_on_complete_fade_out():
	get_tree().change_scene_to_file("res://world/world.tscn")

func _on_kembali_released():
	overlay.fade_out()



