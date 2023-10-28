@tool
extends Area2D
class_name Hurtbox2D


signal on_hit_recived(hitter: Node3D)


const DAMAGE_META = "damage_amount"


## All groups counted for damage, if empty it will take any collision as damage
@export var groups: Array[StringName] = []
@export_category("Damage")
## Cooldown for damage
@export var damage_cooldown: float = 0.5
## The amount of damage to take. Specfiy damage by adding `damage_amount` as meta
@export var damage_amount: int = 10
## The health component to send damage to, Can be null
@export var health_component: HealthComponent 

var _cooldown_timer: float = 0
var _damaging_bodies: Array[Node2D] = []


func _ready() -> void:
	if Engine.is_editor_hint(): return
	
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta: float) -> void:
	if Engine.is_editor_hint(): return
	
	if _cooldown_timer < 0:
		_cooldown_timer = damage_cooldown

		for body in _damaging_bodies:
			if not is_instance_valid(_damaging_bodies):
				continue
			
			if not body in get_overlapping_bodies():
				_damaging_bodies.erase(body)
				continue
			
			on_hit_recived.emit(body)
			var damage = -1
			
			if body.has_meta(DAMAGE_META):
				damage = body.get_meta(DAMAGE_META)
			
			_damage_health(damage)
	else:
		_cooldown_timer -= delta


func _damage_health(damage: int = -1):
	if is_instance_valid(health_component):
		var amount = 0
		
		if damage != -1:
			amount = damage
		else:
			amount = damage_amount
		
		health_component.damage(amount)


func _on_body_entered(body: Node2D):
	var damage = -1
	
	if body.has_meta(DAMAGE_META):
		damage = body.get_meta(DAMAGE_META)
	
	if groups.is_empty():
		on_hit_recived.emit(body)
	else:
		for group in groups:
			if body.is_in_group(group):
				_damaging_bodies.append(body)
				
				on_hit_recived.emit(body)
				_damage_health(damage)
		
		return
	
	_damaging_bodies.append(body)
	_damage_health(damage)

func _on_body_exited(body: Node2D):
	for group in groups:
		if body.is_in_group(group):
			_damaging_bodies.erase(body)
