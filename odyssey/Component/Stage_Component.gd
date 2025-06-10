class_name Stage_Component
extends Resource

@export var Name : String
@export var Scene : PackedScene
@export_enum("graveyard", "field", "city", "dungeon") var music : String
@export_range(1, 4) var world : int
