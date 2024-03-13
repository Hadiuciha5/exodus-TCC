extends Node

var intro_music = load("res://ART/Cherophobia-pseudomorph_0z.ogg")

func _ready():
	pass

func play_music():
	
	$Music.stream = intro_music
	$Music.play()

func stop_muusic():
	$Music.stop()
