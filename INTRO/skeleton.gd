extends CharacterBody2D


var speed = 100 # Kecepatan NPC
var move_direction = Vector2.RIGHT # Arah awal NPC
var timer_duration = 0.5 # Durasi pergerakan dalam satu langkah (detik)
var steps_forward = 3 # Jumlah langkah ke depan
var steps_backward = 3 # Jumlah langkah ke belakang
var current_step = 0 # Langkah saat ini
var walking_forward = true # Apakah NPC sedang berjalan ke depan atau ke belakang
var timer_countdown = timer_duration # Hitung mundur timer
var pause_duration = 1.0 # Durasi jeda (detik)
var pause_timer = pause_duration # Hitung mundur timer jeda
var animated_sprite: AnimatedSprite2D

func _ready():
	animated_sprite = $AnimatedSprite2D
	animated_sprite.play("walk") # Mulai animasi berjalan saat permainan dimulai



func _physics_process(delta):
	# Jika sedang dalam jeda, kurangi timer jeda dan keluar dari fungsi
	if pause_timer > 0:
		pause_timer -= delta
		return
	# Hitung pergerakan NPC
	velocity = move_direction * speed

	# Gerakkan NPC ke arah yang ditentukan
	move_and_slide()
	

	# Periksa dan terapkan flip sprite jika diperlukan
	if move_direction.x > 0:
		$AnimatedSprite2D.flip_h = false # Tidak flip jika bergerak ke kanan
	else:
		$AnimatedSprite2D.flip_h = true # Flip jika bergerak ke kiri

	# Update timer
	timer_countdown -= delta

	# Periksa apakah timer telah mencapai nol
	if timer_countdown <= 0:
		# Menggerakkan NPC
		if walking_forward:
			current_step += 1
			if current_step >= steps_forward:
				walking_forward = false
				move_direction *= -1
				current_step = 0
		else:
			current_step -= 1
			if current_step <= -steps_backward:
				walking_forward = true
				move_direction *= -1
				current_step = 0


		timer_countdown = timer_duration
		# Mulai timer jeda
		pause_timer = pause_duration

