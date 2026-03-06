extends Node

class_name LevelManager

var levels: Dictionary = {}

func _ready() -> void:
    load_levels()

func save_levels() -> void:
    var file = File.new()
    if file.open("user://levels.save", File.WRITE) == OK:
        file.store_var(levels)
        file.close()

func load_levels() -> void:
    var file = File.new()
    if file.file_exists("user://levels.save"):
        if file.open("user://levels.save", File.READ) == OK:
            levels = file.get_var()
            file.close()

func add_level(level_id: String, level_data: Dictionary) -> void:
    levels[level_id] = level_data
    save_levels()

func get_level(level_id: String) -> Dictionary:
    return levels.get(level_id, null)

func remove_level(level_id: String) -> void:
    if levels.has(level_id):
        levels.erase(level_id)
        save_levels()