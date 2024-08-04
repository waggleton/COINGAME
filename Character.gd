extends Node2D
@onready var progress_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer

@export var HP: float = 120

var health: float = 1250:
	set(value):
		health = value
		_update_progress_bar()
		_play_animation()
		
func _update_progress_bar():
	progress_bar.value = (health/HP) * 100
	
func _play_animation():
	animation_player.play("Damage")
	
func get_hit(value):
	health -= value


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
