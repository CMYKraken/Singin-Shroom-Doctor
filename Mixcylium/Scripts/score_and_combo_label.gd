extends Control


func _ready():
	$VBoxContainer/Score.text = str(get_parent().score)
	$VBoxContainer/ScoreMultiplyer.text = str(get_parent().scoreMulti)
	$VBoxContainer/Combo.text = str(get_parent().combo)
	
func _process(delta):
	$VBoxContainer/Score.text = str(get_parent().score)
	$VBoxContainer/ScoreMultiplyer.text = str(get_parent().scoreMulti)
	$VBoxContainer/Combo.text = str(get_parent().combo)
