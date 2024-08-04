extends Node2D
@onready var wheel = $Wheel
@onready var animation_player = $AnimationPlayer

var speen = 1
var rng = RandomNumberGenerator.new()
var spin_result = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	wheel.rotation = wheel.rotation + 5
	spin_result = wheel.global_rotation_degrees
	pass
	
func spin_wheel():
	print("")
		
func result():
	print(spin_result)
	return spin_result
		





