extends Area2D

const LASER_SCENE = preload("res://laser.tscn")
@export var speed = 100

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER_SCENE.instantiate()
		var main = get_tree().current_scene
		main.add_child(laser)
		laser.position = position

func _on_area_entered(area):
	queue_free()
	area.queue_free()