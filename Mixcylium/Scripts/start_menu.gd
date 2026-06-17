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

func _on_settings_pressed():
	$Main_Menu.visible = false
	$Settings_Menu.visible = true
	$Settings_Menu/Settings_Main.visible = true

func _on_exit_pressed():
	get_tree().quit()
#endregion
#region Settings Menu Buttons
#region Settings Main
func _on_general_pressed():
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/General_Settings.visible = true

func _on_volume_pressed():
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/Volume_Settings.visible = true

func _on_controls_pressed():
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/Controls_Settings.visible = true

func _on_return_to_menu_pressed():
	$Main_Menu.visible = true
	$Settings_Menu.visible = false
	$Settings_Menu/Settings_Main.visible = false
	$Level_Select.visible = false
#endregion
#region General Settings
func _on_window_mode_button_item_selected(index: int) -> void:
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
	Input1 = true
	$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = ""

func _on_input_2_pressed():
	Input2 = true
	$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = ""

func _on_input_3_pressed() -> void:
	Input3 = true
	$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = ""

func _on_input_4_pressed() -> void:
	Input4 = true
	$Settings_Menu/Controls_Settings/Input_4_Container/Label.text = ""
#endregion
func _on_back_to_settings_pressed():
	$Settings_Menu/Settings_Main.visible = true
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false
#endregion
#region Level Select
#region Level_1

#endregion
