extends Area2D

const LASER_SCENE = preload("res://laser.tscn")
@export var speed = 100
var height = ProjectSettings.get_setting("display/window/size/viewport_height") - 8.5

signal ship_destroyed

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if position.y >= 8.5:
			position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		if position.y <= height:
			position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER_SCENE.instantiate()
		var main = get_tree().current_scene
		main.add_child(laser)
		laser.position = position

func _on_area_entered(area):
	queue_free()
	area.queue_free()
	ship_destroyed.emit()
