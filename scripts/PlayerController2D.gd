extends KinematicBody2D

#global variables
export (int) var speed = 300
export (int) var gravity = 1200

var velocity := Vector2.ZERO
var jumping = false;
var jumpCount = 1;

onready var slimey = $Slimey;

func _ready():
	print(velocity.y)
	
#gets the input of the player and creates movement
func update_x():
	velocity.x = 0
	if Input.is_action_pressed("walk_right"):
		velocity.x += speed
		slimey.flip_h = false
	if Input.is_action_pressed("walk_left"):
		velocity.x -= speed
		slimey.flip_h = true;
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	

func _physics_process(delta):
	update_x()
	# If touching the ground, refresh the jump counter.
	if is_on_floor():
		if GlobalVariables.canDoubleJump && GlobalVariables.hasPowerup:
			jumpCount = 2
		else:
			jumpCount = 1
		jumping = false
		

	# Should we jump?
	if Input.is_action_just_pressed("jump") and jumpCount > 0:
		jumpCount -= 1 # One less jump!
		jumping = true
		#jump higher if High Jump is collected
		if GlobalVariables.canHighJump and GlobalVariables.hasPowerup:
			GlobalVariables.jump_speed = -900
		else:
			GlobalVariables.jump_speed = -700
		velocity.y = GlobalVariables.jump_speed

	# To allow controlling the jump height, instantly set the velocity when the jump key is released.
	# Some recommend quadrupling the gravity instead.
	if not is_on_floor() and Input.is_action_just_released("jump") and velocity.y < -50:
		velocity.y = -50

	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP) 

	

	
