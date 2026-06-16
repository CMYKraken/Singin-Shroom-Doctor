extends Control



func _ready():
	$Main_Menu.visible = true
	$Level_Select.visible = false
	$Settings_Menu.visible = false
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false



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

#endregion
#region Controls Settings

#endregion
func _on_back_to_settings_pressed():
	$Settings_Menu/Settings_Main.visible = true
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false
#endregion
