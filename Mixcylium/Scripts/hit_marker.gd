extends Label

func _ready():
	position = get_parent().position
	position += Vector2(-500,-1000)
	match get_parent().score:
		0:
			$".".self_modulate = Color(225,0,0)
			$".".text = "Miss"
		333:
			$".".self_modulate = Color(225,225,0)
			$".".text = "OK"
		555:
			$".".self_modulate = Color(0,225,0)
			$".".text = "Perfect"


func _on_timer_timeout():
	get_parent().queue_free()
