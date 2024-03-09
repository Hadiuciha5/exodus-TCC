extends Node2D

@onready var overlay := %FadeOverlay
@onready var return_button := %kembali


func _ready():
	overlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)
	return_button.pressed.connect(_on_kembali_released)
	
	overlay.visible = true
	

func _on_fade_overlay_on_complete_fade_out():
	get_tree().change_scene_to_file("res://pick_menu/pick_menu.tscn")

func _on_kembali_released():
	overlay.fade_out()



