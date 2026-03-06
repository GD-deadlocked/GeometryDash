# LevelData.gd

extends Resource

# Define the level data structure
# Metadata for the level
var level_name: String
var level_id: int
var creator: String
var difficulty: String
var objects: Array
var timestamp: String

# Constructor - initializes the level data
func _init(name: String, id: int, creator: String, difficulty: String, objects: Array):
    level_name = name
    level_id = id
    creator = creator
    difficulty = difficulty
    objects = objects
    timestamp = OS.get_datetime().strftime("%Y-%m-%d %H:%M:%S")

# Serialization - convert the level data to a dictionary
func to_dict() -> Dictionary:
    return {
        "level_name": level_name,
        "level_id": level_id,
        "creator": creator,
        "difficulty": difficulty,
        "objects": objects,
        "timestamp": timestamp
    }

# Deserialization - create an instance from a dictionary
static func from_dict(data: Dictionary) -> LevelData:
    return LevelData.new(
        data["level_name"],
        data["level_id"],
        data["creator"],
        data["difficulty"],
        data["objects"]
    )