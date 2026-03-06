extends Area2D
signal activated
var jump_force = -800

# Collision shape
var collision_shape = RectangleShape2D.new()
collision_shape.set_size(Vector2(64, 32))
add_child(collision_shape)

# Sprite
var sprite = Sprite.new()
sprite.modulate = Color(0, 1, 0)  # GREEN
add_child(sprite)

# Connect area_entered signal
func _ready():
    connect("area_entered", self, "_on_area_entered")

func _on_area_entered(area):
    if area.is_in_group("player"):
        area.apply_force(Vector2(0, jump_force))
        emit_signal("activated")