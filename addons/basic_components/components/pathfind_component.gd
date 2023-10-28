@tool
extends Component
class_name PathfindComponent


signal velocity_update(velocity: Vector2)


## The position to pathfind to
@export var pathfind_to := Vector2.ZERO
## The position to pathfind from
@export var position := Vector2.ZERO


var _velocity := Vector2.ZERO


func _physics_process(_delta: float) -> void:
	var previous_velocity := _velocity
	
	if position.distance_to(pathfind_to) > 5:
		_velocity = -(position - pathfind_to).normalized()
	else:
		_velocity = Vector2.ZERO
	
	if previous_velocity != _velocity:
		velocity_update.emit(_velocity)


func get_velocity():
	return _velocity
