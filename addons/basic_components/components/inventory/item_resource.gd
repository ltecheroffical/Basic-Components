extends Resource
class_name Item


@export var name: String
@export var texture: Texture2D

@export_multiline var description: String
@export_range(1, 64) var max_stack: int


var metadata := {}
