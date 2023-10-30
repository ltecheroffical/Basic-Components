extends Component
class_name VelocityComponent2D


signal velocity_update(velocity: Vector2)


## The inital velocity applied
@export var inital_velocity: Vector2 = Vector2()
## The speed to apply when using `set_direction`
@export var SPEED: float = 300.0


var _velocity = Vector2.ZERO


func _ready() -> void:
	_velocity = inital_velocity
	velocity_update.emit(_velocity)


func set_velocity(velocity: Vector2) -> void:
	_velocity = velocity
	velocity_update.emit(_velocity)

func change_velocity(by: Vector2) -> void:
	_velocity += by
	velocity_update.emit(_velocity)

func get_velocity() -> Vector2:
	return _velocity


func set_direction(direction: Vector2) -> void:
	_velocity = direction.normalized() * SPEED
	velocity_update.emit(_velocity)
