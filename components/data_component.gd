@tool
extends Component
class_name DataComponent

signal data_added(key: String, value)
signal data_changed(key: String, value)
signal data_removed(key: String)


@export var _data = {}


func set_data(key: String, value):
	var added = not has_data(key)
	_data[key] = value

	if added:
		data_added.emit(key, value)
	else:
		data_changed.emit(key, value)

func delete_data(key: String) -> void:
	_data.erase(key)
	data_removed.emit(key)

func get_data(key: String) -> Variant:
	return _data[key]

func has_data(key: String) -> bool:
	return _data.has(key)
