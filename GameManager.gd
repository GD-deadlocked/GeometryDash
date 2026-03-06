extends Node2D

var score = 0
var obstacles = []

# Called when the node enters the scene tree for the first time.
func _ready():
    get_tree().create_timer(1.0).connect("timeout", self, "_on_timeout")

# Timer event to spawn obstacles
func _on_timeout():
    spawn_obstacle()

# Function to spawn a 64-pixel obstacle at a random position
func spawn_obstacle():
    var obstacle = Sprite.new()
    obstacle.texture = preload("res://path/to/your/obstacle_texture.png") # Change to your texture path
    obstacle.position = Vector2(randf() * get_viewport().size.x, get_viewport().size.y)
    obstacle.scale = Vector2(64, 64)
    add_child(obstacle)
    obstacles.append(obstacle)

# Function to increase score
func increase_score(amount: int):
    score += amount
    print("Score: {score}")  
