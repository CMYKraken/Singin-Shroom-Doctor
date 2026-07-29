extends Control

func _ready():
	$Menu.visible = false

func _process(delta):
	if get_parent().get_child(-1).scene_file_path != "res://Mixcylium/Prefabs/end_screen.tscn":
		if Input.is_action_just_pressed("Pause"):
			if get_tree().paused == false:
				get_tree().paused = true
				$Menu.visible = true
			
			elif get_tree().paused == true:
				get_tree().paused = false
				$Menu.visible = false
	else:
		$Menu.visible = false


func _on_resume_pressed():
	get_tree().paused = false
	$Menu.visible = false


func _on_back_to_level_select_pressed():
	get_parent().get_parent().get_node("Level_Select").visible = true
	get_parent().get_parent().get_node("Level_Select/Right_Side/Level_"+str(get_parent().Level_Number)+"_Preview/Level_"+str(get_parent().Level_Number)+"_Preview_Player").play()
	get_tree().paused = false
	get_parent().queue_free()
