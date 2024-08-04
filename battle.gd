extends Node2D
@onready var farmer = $Farmer
@onready var enemy = $Enemy
@onready var wheelspin = $Wheelspin
@onready var texture_rect = $TextureRect
@onready var winning_screen = $"Winning Screen"
@onready var losing_screen_2 = $"Losing Screen2"
@onready var attack_coin = $"Attack Coin"
@onready var bgm = $BGM
@onready var winning = $Winning
@onready var losing = $Losing


var farmer_damage = 0
var enemy_damage = 0
var nonconvertedturn = null
var turn = 0
var battle_phase = 0
var spin_result
var reset
var winner

	
func start_battle():
	spin_result = abs(spin_result)
	
	if spin_result > 90:
		enemy_turn()
		
		
	if spin_result < 91:
		farmer_turn()
		
		
		
func farmer_turn():
	farmer_damage = farmer.attack()
	if reset == 1:
		farmer_damage = 0
		reset = 0
	enemy.get_hit(farmer_damage)
	print(farmer.health)  # Check for SPACE key
	get_tree().paused = true
	await enemy.animation_player.animation_finished
	get_tree().paused = false
	battle_phase = 0
	
		
	if enemy.health < 0:
		winning.play()
		winner = "Farmer"
		battle_phase = 2
		
	
		
func enemy_turn():
	enemy_damage = enemy.attack()
	if reset == 1:
		enemy_damage = 0
		reset = 0
	farmer.get_hit(enemy_damage)
	print(enemy.health)
	get_tree().paused = true
	await farmer.animation_player.animation_finished
	get_tree().paused = false
	battle_phase = 0
	
	if farmer.health < 0:
		losing.play()
		winner = "Enemy"
		battle_phase = 2
	
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	winning_screen.visible = false
	losing_screen_2.visible = false
	
	bgm.play()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	wheelspin.spin_wheel()
	
	if battle_phase == 0:
		if Input.is_key_pressed(KEY_SPACE): # Check for SPACE key
			attack_coin.play()
			print("space has been pressed")
			spin_result = wheelspin.result()
			print(spin_result)
			print(turn)
			battle_phase = 1
			
	
	
	if battle_phase == 1:
		start_battle()
		
	if battle_phase == 2:
		
		if winner == "Enemy":
			
			losing_screen_2.visible = true
			bgm.stop()
			
			if Input.is_key_pressed(KEY_SPACE):
				losing.stop()
				bgm.play()
				print("space has been pressed")
				farmer.health=120
				enemy.health=120
				losing_screen_2.visible=false
				battle_phase=0
				reset=1

		if winner == "Farmer":
			winning_screen.visible = true
			bgm.stop()
			
			
			if Input.is_key_pressed(KEY_SPACE): # Check for SPACE key
				winning.stop()
				bgm.play()
				print("space has been pressed")
				farmer.health=120
				enemy.health=120
				winning_screen.visible=false
				battle_phase=0
				reset=1

	pass
