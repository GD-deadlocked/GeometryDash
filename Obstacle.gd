extends Area2D

# Signal emitted when the obstacle is hit
signal hit

func _ready():
    var collision_shape = CollisionShape2D.new()
    collision_shape.shape = RectangleShape2D.new()
    collision_shape.shape.extents = Vector2(32, 32) # Half of 64 pixels width and height
    add_child(collision_shape)

    # Connect the body entered signal to check for collisions
    self.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
    if body.is_in_group("player"): # Assuming the player is in the "player" group
        emit_signal("hit") # Emit the hit signal when the player collides with the obstacle
