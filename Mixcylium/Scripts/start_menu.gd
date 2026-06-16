extends Control

var Input1
var Input2

func _ready():
	$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = "a"
	$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = "d"
	$Main_Menu.visible = true
	$Level_Select.visible = false
	$Settings_Menu.visible = false
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false

func _process(delta):
	if Input1 == true:
			Input1 = false
	if Input2 == true:
			Input2 = false

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
#endregion
#region General Settings

#endregion
#region Volume Settings
func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	
func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(3, linear_to_db(value))
	
func _on_music_beats_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
#endregion
#region Controls Settings
func _on_input_1_pressed():
	pass # Replace with function body.

func _on_input_2_pressed():
	pass # Replace with function body.

#endregion
func _on_back_to_settings_pressed():
	$Settings_Menu/Settings_Main.visible = true
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false
#endregion
