extends TextureProgressBar

func _process(delta):
	value = get_parent().playerHealth
