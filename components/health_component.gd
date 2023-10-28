@tool
extends Component
class_name HealthComponent


signal on_death()
signal health_changed(health: int)


@export var max_health = 50


var health : float = 0


func _enter_tree() -> void:
	health = max_health

func _clamp_health() -> void:
	health = clamp(health, 0, max_health)


func damage(amount: int) -> void:
	health -= amount
	_clamp_health()

	if not is_alive():
		on_death.emit()

	health_changed.emit(health)

func heal(amount: int) -> void:
	health += amount
	_clamp_health()

	health_changed.emit(health)

func get_health() -> int:
	return int(health)

func set_health(health: int) -> void:
	health = health

func is_alive() -> bool:
	return health > 0
