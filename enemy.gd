extends Node2D
@onready var progress_bar = $Character/ProgressBar
@onready var animation_player = $Character/AnimationPlayer
@onready var hurt_enemy = $HurtEnemy
@export var HP: float = 120

var health: float = 120:
	set(value):
		health = value
		_update_progress_bar()
		
		
func _update_progress_bar():
		progress_bar.value = (health/HP) * 100
	
func _play_animation():
	animation_player.play("Damage")
	
func get_hit(value):
	hurt_enemy.play()
	health -= value
	_play_animation()
	await animation_player.animation_finished
	


func attack():
	var damage = randf_range(5,25)
	return damage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
