@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("Component", "Node",
		preload("res://addons/basic_components/components/component.gd"), null)
	
	add_custom_type("DataComponent", "Component",
		preload("res://addons/basic_components/components/data_component.gd"), null)
	
	
	add_custom_type("VelocityComponent2D", "Component",
		preload("res://addons/basic_components/components/velocity/velocity_component_2d.gd"), null)
	add_custom_type("VelocityComponent3D", "Component",
		preload("res://addons/basic_components/components/velocity/velocity_component_3d.gd"), null)

	
	add_custom_type("HealthComponent", "Component",
		preload("res://addons/basic_components/components/health_component.gd"), null)
	
	
	add_custom_type("InventoryComponent", "Component",
		preload("res://addons/basic_components/components/inventory/inventory_component.gd"), null)
	add_custom_type("Item", "Resource",
		preload("res://addons/basic_components/components/inventory/item_resource.gd"), null)
	
	add_custom_type("Hurtbox2D", "Area2D",
		preload("res://addons/basic_components/components/hurtbox/hurtbox_2d.gd"), null)
	add_custom_type("Hurtbox3D", "Area3D",
		preload("res://addons/basic_components/components/hurtbox/hurtbox_3d.gd"), null)
	
	
	add_custom_type("Watchbox2D", "Area2D",
		preload("res://addons/basic_components/components/watchbox/watchbox_2d.gd"), null)
	add_custom_type("Watchbox3D", "Area3D",
		preload("res://addons/basic_components/components/watchbox/watchbox_3d.gd"), null)


func _exit_tree() -> void:
	remove_custom_type("Component")
	remove_custom_type("DataComponent")
	remove_custom_type("HealthComponent")
	
	remove_custom_type("VelocityComponent2D")
	
	remove_custom_type("InventoryComponent")
	
	remove_custom_type("Hurtbox2D")
	remove_custom_type("Hurtbox3D")
	
	remove_custom_type("Watchbox2D")
	remove_custom_type("Watchbox3D")
