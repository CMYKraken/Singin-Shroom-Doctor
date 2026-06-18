extends Control

var Input1
var Input2
var Input3
var Input4

func _ready():
	$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = "D"
	$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = "F"
	$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = "J"
	$Settings_Menu/Controls_Settings/Input_4_Container/Label.text = "K"
	$Main_Menu.visible = true
	$Level_Select.visible = false
	$Settings_Menu.visible = false
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false
	$Level_Select/Right_Side/Level_1_Preview.visible = true
	$Level_Select/Right_Side/Level_2_Preview.visible = false
	$Level_Select/Right_Side/Level_3_Preview.visible = false

func _process(delta):
	Button_Check()

#region Changing Controls
func _unhandled_key_input(event: InputEvent) -> void:
	if Input1 == true:
		InputMap.action_erase_events("Action_1")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_1",event)
			$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = event.as_text()
			Input1 = false
		else:
			$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = "Key Already Bound"
	if Input2 == true:
		InputMap.action_erase_events("Action_2")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_2",event)
			$Settings_Menu/Controls_Settings/Input_2_Container/Label.text =  event.as_text()
			Input2 = false
		else:
			$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = "Key Already Bound"
	if Input3 == true:
		InputMap.action_erase_events("Action_3")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_3",event)
			$Settings_Menu/Controls_Settings/Input_3_Container/Label.text =  event.as_text()
			Input3 = false
		else:
			$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = "Key Already Bound"
	if Input4 == true:
		InputMap.action_erase_events("Action_4")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_4",event)
			$Settings_Menu/Controls_Settings/Input_4_Container/Label.text =  event.as_text()
			Input4 = false
		else:
			$Settings_Menu/Controls_Settings/Input_4_Container/Label.text = "Key Already Bound"

func CheckConflict(Action):
	if InputMap.action_has_event("Action_1", Action):
		return true
	if InputMap.action_has_event("Action_2", Action):
		return true
	if InputMap.action_has_event("Action_3", Action):
		return true
	if InputMap.action_has_event("Action_4", Action):
		return true
	return false
#endregion
#region Main Menu Buttons
func _on_start_pressed():
	$Main_Menu.visible = false
	$Level_Select.visible = true
	$Button_SFX_Player.play()
	$Level_Select/Right_Side/Level_1_Preview/Level_1_Preview_Player.play()
	$Main_Menu_Player.stop()

func _on_settings_pressed():
	$Main_Menu.visible = false
	$Settings_Menu.visible = true
	$Settings_Menu/Settings_Main.visible = true
	$Button_SFX_Player.play()

func _on_exit_pressed():
	$Button_SFX_Player.play()
	get_tree().quit()
#endregion
#region Settings Menu Buttons
#region Settings Main
func _on_general_pressed():
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/General_Settings.visible = true
	$Button_SFX_Player.play()

func _on_volume_pressed():
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/Volume_Settings.visible = true
	$Button_SFX_Player.play()

func _on_controls_pressed():
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/Controls_Settings.visible = true
	$Button_SFX_Player.play()

func _on_return_to_menu_pressed():
	$Main_Menu.visible = true
	$Settings_Menu.visible = false
	$Settings_Menu/Settings_Main.visible = false
	$Button_SFX_Player.play()
	if $Level_Select.visible == true:
		$Level_Select/Right_Side/Level_2_Preview/Level_2_Preview_Player.stop()
		$Level_Select/Right_Side/Level_3_Preview/Level_3_Preview_Player.stop()
		$Level_Select/Right_Side/Level_1_Preview/Level_1_Preview_Player.stop()
		$Main_Menu_Player.play()
		$Level_Select.visible = false
	
	
#endregion
#region General Settings
func _on_window_mode_button_item_selected(index: int) -> void:
	$Button_SFX_Player.play()
	match index:
		0:
			DisplayServer.WINDOW_MODE_WINDOWED
		1:
			DisplayServer.WINDOW_MODE_FULLSCREEN

#endregion
#region Volume Settings
func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	
func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	
func _on_music_beats_slider_value_changed(value):
	AudioServer.set_bus_volume_db(3, linear_to_db(value))
#endregion
#region Controls Settings
func _on_input_1_pressed():
	$Button_SFX_Player.play()
	Input1 = true
	$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = ""

func _on_input_2_pressed():
	$Button_SFX_Player.play()
	Input2 = true
	$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = ""

func _on_input_3_pressed() -> void:
	$Button_SFX_Player.play()
	Input3 = true
	$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = ""

func _on_input_4_pressed() -> void:
	$Button_SFX_Player.play()
	Input4 = true
	$Settings_Menu/Controls_Settings/Input_4_Container/Label.text = ""
#endregion
func _on_back_to_settings_pressed():
	$Settings_Menu/Settings_Main.visible = true
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false
	$Button_SFX_Player.play()
#endregion
#region Level Select
#region Level Options
func _on_level_1_pressed():
	$Level_Select/Right_Side/Level_1_Preview.visible = true
	$Level_Select/Right_Side/Level_2_Preview.visible = false
	$Level_Select/Right_Side/Level_3_Preview.visible = false
	$Button_SFX_Player.play()
	$Level_Select/Right_Side/Level_2_Preview/Level_2_Preview_Player.stop()
	$Level_Select/Right_Side/Level_3_Preview/Level_3_Preview_Player.stop()
	$Level_Select/Right_Side/Level_1_Preview/Level_1_Preview_Player.play()

func _on_level_2_pressed():
	$Level_Select/Right_Side/Level_1_Preview.visible = false
	$Level_Select/Right_Side/Level_2_Preview.visible = true
	$Level_Select/Right_Side/Level_3_Preview.visible = false
	$Button_SFX_Player.play()
	$Level_Select/Right_Side/Level_1_Preview/Level_1_Preview_Player.stop()
	$Level_Select/Right_Side/Level_3_Preview/Level_3_Preview_Player.stop()
	$Level_Select/Right_Side/Level_2_Preview/Level_2_Preview_Player.play()
	

func _on_level_3_pressed():
	$Level_Select/Right_Side/Level_1_Preview.visible = false
	$Level_Select/Right_Side/Level_2_Preview.visible = false
	$Level_Select/Right_Side/Level_3_Preview.visible = true
	$Button_SFX_Player.play()
	$Level_Select/Right_Side/Level_2_Preview/Level_2_Preview_Player.stop()
	$Level_Select/Right_Side/Level_1_Preview/Level_1_Preview_Player.stop()
	$Level_Select/Right_Side/Level_3_Preview/Level_3_Preview_Player.play()
#endregion
#region Button Check
func Button_Check():
	if $Level_Select/Right_Side/Level_1_Preview.visible == true:
		if $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Speed.selected > 0 and $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Dificulty.selected > 0:
			$"Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Start_Level_1".disabled = false
		else:
			$"Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Start_Level_1".disabled = true
	elif $Level_Select/Right_Side/Level_2_Preview.visible == true:
		if $Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Select_Speed.selected > 0 and $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Dificulty.selected > 0:
			$"Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Start_Level_2".disabled = false
		else:
			$"Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Start_Level_2".disabled = true
	elif $Level_Select/Right_Side/Level_3_Preview.visible == true:
		if $Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Select_Speed.selected > 0 and $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Dificulty.selected > 0:
			$"Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Start_Level_3".disabled = false
		else:
			$"Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Start_Level_3".disabled = true
#endregion
#region Start Level
func _on_start_level_1_pressed():
	$Button_SFX_Player.play()
	var speed = $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Speed.selected -1
	var difficulty = $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Dificulty.selected -1
	var Level = preload("res://Mixcylium/Prefabs/level_manager.tscn")
	var Scene = Level.instantiate()#speed,difficulty)
	add_child(Scene)
	$Level_Select.visible = false

func _on_start_level_2_pressed():
	pass # Replace with function body.

func _on_start_level_3_pressed():
	pass # Replace with function body.
#endregion
#endregion
