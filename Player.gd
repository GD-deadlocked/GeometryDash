extends KinematicBody2D

# Player properties
var speed = 200
var jump_strength = -400
var is_jumping = false
var velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    # Handle player input
    if Input.is_action_pressed("ui_right"):
        velocity.x = speed
    elif Input.is_action_pressed("ui_left"):
        velocity.x = -speed
    else:
        velocity.x = 0

    # Handle jumping
    if is_on_floor() and Input.is_action_just_pressed("ui_up"):
        velocity.y = jump_strength
        is_jumping = true

    # Apply gravity
    if is_jumping:
        velocity.y += 20 # gravity

    # Move the player
    velocity = move_and_slide(velocity, Vector2.UP)

# Called when the node enters the scene tree for the first time.
func _ready():
    # Optionally set up your player sprite or animations here
    pass

# Function to detect collisions
func _on_body_entered(body):
    if body.is_in_group("enemies"):
        queue_free()  # The player dies if it collides with an enemy
