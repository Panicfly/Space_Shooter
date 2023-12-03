extends Area2D

@export var speed = 40
@export var armor = 4

func _process(delta):
	position.x -= speed * delta

func _on_body_entered(body):
	body.queue_free()
	armor -= 1
	if armor <= 0: 
		var world = get_tree().current_scene
		world.score += 100
		queue_free()

func _on_visible_on_screen_enabler_2d_screen_exited():
	var world = get_tree().current_scene
	world.hearts -= 1
	queue_free()
