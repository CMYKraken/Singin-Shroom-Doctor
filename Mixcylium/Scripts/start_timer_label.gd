extends Label

var number = 3

func _ready():
	$".".text = "3"

func _on_timer_timeout():
	match number:
		3:
			$".".text = "2"
			number -= 1
		2:
			$".".text = "1"
			number -= 1
		1:
			$".".text = "Start"
			number -= 1
		0:
			queue_free()
