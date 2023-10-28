@tool
extends Area3D
class_name Watchbox3D


signal on_watch_entered(body: Node3D)
signal on_watch_exited(body: Node3D)


@export var groups: Array[StringName] = []


func _ready() -> void:
	if Engine.is_editor_hint(): return
	
	body_entered.connect(_entered_watchbox)
	body_exited.connect(_exited_watchbox)


func _entered_watchbox(body: Node3D):
	for group in groups:
		if body.is_in_group(group):
			on_watch_entered.emit(body)

func _exited_watchbox(body: Node3D):
	for group in groups:
		if body.is_in_group(group):
			on_watch_exited.emit(body)
