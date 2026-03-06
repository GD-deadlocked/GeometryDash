extends Area2D
signal collected

var orb_value = 10

# Collision shape
var shape = CircleShape2D.new()
shape.radius = 20
var collision_shape = CollisionShape2D.new()
collision_shape.shape = shape
add_child(collision_shape)

# Sprite
var sprite = Sprite.new()
sprite.texture = preload("res://64_pixel_orb.png")
sprite.modulate = Color(1, 1, 0) # YELLOW
add_child(sprite)

func _ready():
    connect("area_entered", self, "_on_area_entered")

func _on_area_entered(area):
    if area.is_in_group("player"):
        emit_signal("collected")
        queue_free()