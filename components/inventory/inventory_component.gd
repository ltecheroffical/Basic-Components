@tool
extends Component
class_name InventoryComponent


signal inventory_changed()

signal item_added(item: Item)
signal item_removed(item: Item)
signal item_moved(from: int, to: int)


## The items that the inventory contains
@export var items: Array[Item] = []
@export_subgroup("Storage")
## Max stacks the inventory can store
@export var max_stacks: int = 9:
	set(value):
		max_stacks = max(value, 1)
## If the items can stack more than one item
@export var items_stackable: bool = true

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	
	while true:
		if len(items) >= max_stacks:
			break
		
		items.append(null)
	
	item_added.connect(func(_item: Item):
		inventory_changed.emit())
	item_removed.connect(func(_item: Item):
		inventory_changed.emit())
	item_moved.connect(func(_from: int, _to: int):
		inventory_changed.emit())
	
	

func add_item(item: Item, at: int = -1):
	if at == -1:
		items[len(items) - 1] = item
	else:
		items[at] = item
	
	item_added.emit(item)

func remove_item(index: int):
	var item = items[index]
	items[index] = null
	
	item_removed.emit(item)

func move_item(from: int, to: int):
	var from_item = items[from]
	var to_item = items[to]
	
	items[to] = from_item
	items[from] = to_item
	
	item_moved.emit(from, to)
