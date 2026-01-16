extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const GRAVITY = 1000
@export var SPEED : int = 300
@export var JUMP : int = -500
@export var JUMP_HORI : int = 50

enum State { Idle, Run, Jump }

var current_state : State 

var character_sprite : Sprite2D

func _ready():
		
	current_state = State.Idle 
	
func _physics_process(delta : float):
	player_falling(delta)
	player_run(delta)
	player_jump(delta)
	player_idle(delta)

	move_and_slide()
	
	player_Animation()
	
	print("the state is ", State.keys()[current_state])

func player_falling(delta : float):
	if !is_on_floor():
		velocity.y += GRAVITY * delta
		current_state = State.Jump

func player_idle(_delta : float):
	if is_on_floor() and velocity.x == 0 and velocity.y == 0:
		current_state = State.Idle

func player_run(_delta : float):
	if !is_on_floor():
		return
	
	var dir = input_movement()

	if dir:
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if dir != 0:
		current_state = State.Run
		animated_sprite_2d.flip_h = false if dir > 0 else true

func player_jump(delta : float):
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP
		current_state = State.Jump
	
	if !is_on_floor() and current_state == State.Jump:
		var direction = input_movement()
		velocity.x += direction * JUMP_HORI * delta 
	
func player_Animation():
	if current_state == State.Idle:
		animated_sprite_2d.play("Idle")
	elif current_state == State.Run:
		animated_sprite_2d.play("Run")
	elif current_state == State.Jump:
		animated_sprite_2d.play("Jump")

func input_movement():
	var direction : float = Input.get_axis("move_left", "move_right")
	
	return direction

func _on_water_detection_2d_water_state_changed(is_in_water: bool):
	self.is_in_water = is_in_water	
	print(is_in_water)


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		print("enemy entered", body.damage.amount)
		HealthManager.decrease_health(body.damage.amount)
		
