extends Control

var Input1
var Input2
var Input3
var Input4
var MasterVolume = 0.75
var SFXVolume = 0.75
var MusicVolume = 0.75
var MusicBeatsVolume = 0.75
var HitMarkerVolume = 0.75
var ConfigScore = ConfigFile.new()
var ConfigSetting = ConfigFile.new()
var LevelCount = 3
var ScoreData = {
	"Level_1":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_2":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_3":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_4":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_5":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_6":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_7":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_8":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_9":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_10":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_11":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_12":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_13":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_14":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]},
	"Level_15":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png")]}
}


func _ready():
	LoadSettings()
	Update_Volume()
	LoadScore()
	Update_Scores()
	$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = InputMap.action_get_events("Action_1")[0].as_text()
	$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = InputMap.action_get_events("Action_2")[0].as_text()
	$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = InputMap.action_get_events("Action_3")[0].as_text()
	$Settings_Menu/Controls_Settings/Input_4_Container/Label.text = InputMap.action_get_events("Action_4")[0].as_text()
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
	if $Level_Select.visible:
		Button_Check()

#region Savining and loading
#region Settings
func SaveSettings():
	#Volume
	ConfigSetting.set_value("Volume", "Master", MasterVolume)
	ConfigSetting.set_value("Volume", "SFX", SFXVolume)
	ConfigSetting.set_value("Volume", "Music", MusicVolume)
	ConfigSetting.set_value("Volume", "MusicBeats", MusicBeatsVolume)
	ConfigSetting.set_value("Volume", "HitMarker", HitMarkerVolume)
	#Controls
	ConfigSetting.set_value("Controls","Action_1", InputMap.action_get_events("Action_1")[0])
	ConfigSetting.set_value("Controls","Action_2", InputMap.action_get_events("Action_2")[0])
	ConfigSetting.set_value("Controls","Action_3", InputMap.action_get_events("Action_3")[0])
	ConfigSetting.set_value("Controls","Action_4", InputMap.action_get_events("Action_4")[0])
	
	ConfigSetting.save("user://settings.cfg")

func LoadSettings():
	var SettingFile = ConfigSetting.load("user://settings.cfg")
	if SettingFile != OK:
		return
	for setting in ConfigSetting.get_sections():
		if setting == "Volume":
			MasterVolume = ConfigSetting.get_value("Volume","Master")
			SFXVolume = ConfigSetting.get_value("Volume","SFX")
			MusicVolume = ConfigSetting.get_value("Volume","Music")
			MusicBeatsVolume = ConfigSetting.get_value("Volume","MusicBeats")
			HitMarkerVolume = ConfigSetting.get_value("Volume","HitMarker")
		if setting == "Controls":
			InputMap.action_erase_events("Action_1")
			InputMap.action_add_event("Action_1",ConfigSetting.get_value("Controls","Action_1"))
			InputMap.action_erase_events("Action_2")
			InputMap.action_add_event("Action_2",ConfigSetting.get_value("Controls","Action_2"))
			InputMap.action_erase_events("Action_3")
			InputMap.action_add_event("Action_3",ConfigSetting.get_value("Controls","Action_3"))
			InputMap.action_erase_events("Action_4")
			InputMap.action_add_event("Action_4",ConfigSetting.get_value("Controls","Action_4"))
		if setting == "General":
			pass

func Update_Volume():
	AudioServer.set_bus_volume_db(0, linear_to_db(MasterVolume))
	AudioServer.set_bus_volume_db(1, linear_to_db(SFXVolume))
	AudioServer.set_bus_volume_db(2, linear_to_db(MusicVolume))
	AudioServer.set_bus_volume_db(3, linear_to_db(MusicBeatsVolume))
	AudioServer.set_bus_volume_db(4, linear_to_db(HitMarkerVolume))
	$Settings_Menu/Volume_Settings/Master_Slider.value = MasterVolume
	$Settings_Menu/Volume_Settings/SFX_Slider.value = SFXVolume
	$Settings_Menu/Volume_Settings/Music_Slider.value = MusicVolume
	$Settings_Menu/Volume_Settings/Music_Beats_Slider.value = MusicBeatsVolume
	$Settings_Menu/Volume_Settings/Hit_Marker_Slider.value = HitMarkerVolume
#endregion
#region Scores
func SaveScore():
	for I in LevelCount:
		for P in 3:
			var Diff
			match P:
				0:
					Diff = "Easy"
				1:
					Diff = "Medium"
				2:
					Diff = "Hard"
			ConfigScore.set_value("Level_"+str(I+1)+Diff, "Level_name", "Level_"+str(I+1))
			ConfigScore.set_value("Level_"+str(I+1)+Diff, "Level_difficulty", Diff)
			ConfigScore.set_value("Level_"+str(I+1)+Diff, "Level_score", ScoreData["Level_"+str(I+1)][Diff][0])
			ConfigScore.set_value("Level_"+str(I+1)+Diff, "Level_grade", ScoreData["Level_"+str(I+1)][Diff][1])
	ConfigScore.save("user://scores.cfg")

func LoadScore():
	var ScoreFile = ConfigScore.load("user://scores.cfg")
	if ScoreFile != OK:
		return
	for level in ConfigScore.get_sections():
		var LevelName = ConfigScore.get_value(level,"Level_name")
		var LevelDiff = ConfigScore.get_value(level, "Level_difficulty")
		var LevelScore = ConfigScore.get_value(level, "Level_score")
		var LevelGrade = ConfigScore.get_value(level, "Level_grade")
		var LevelDict = {LevelDiff: [LevelScore,LevelGrade]}
		ScoreData[LevelName].merge(LevelDict, true)

func Update_Scores():
	for I in LevelCount:
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel/Score").text = str(ScoreData["Level_"+str(I+1)]["Easy"][0])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel2/Score").text = str(ScoreData["Level_"+str(I+1)]["Medium"][0])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel3/Score").text = str(ScoreData["Level_"+str(I+1)]["Hard"][0])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel/Rank").texture = ScoreData["Level_"+str(I+1)]["Easy"][1]
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel2/Rank").texture = ScoreData["Level_"+str(I+1)]["Medium"][1]
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel3/Rank").texture = ScoreData["Level_"+str(I+1)]["Hard"][1]
	SaveScore()
	print_debug("Updated")
#endregion
#endregion

#region Changing Controls
func _unhandled_key_input(event: InputEvent) -> void:
	if Input1 == true:
		InputMap.action_erase_events("Action_1")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_1",event)
			$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = event.as_text()
			Input1 = false
			SaveSettings()
		else:
			$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = "Key Already Bound"
	if Input2 == true:
		InputMap.action_erase_events("Action_2")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_2",event)
			$Settings_Menu/Controls_Settings/Input_2_Container/Label.text =  event.as_text()
			Input2 = false
			SaveSettings()
		else:
			$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = "Key Already Bound"
	if Input3 == true:
		InputMap.action_erase_events("Action_3")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_3",event)
			$Settings_Menu/Controls_Settings/Input_3_Container/Label.text =  event.as_text()
			Input3 = false
			SaveSettings()
		else:
			$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = "Key Already Bound"
	if Input4 == true:
		InputMap.action_erase_events("Action_4")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Action_4",event)
			$Settings_Menu/Controls_Settings/Input_4_Container/Label.text =  event.as_text()
			Input4 = false
			SaveSettings()
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
	MasterVolume = value
	SaveSettings()

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	SFXVolume = value
	SaveSettings()

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	MusicVolume = value
	SaveSettings()

func _on_music_beats_slider_value_changed(value):
	AudioServer.set_bus_volume_db(3, linear_to_db(value))
	MusicBeatsVolume = value
	SaveSettings()

func _on_hit_marker_slider_value_changed(value):
	AudioServer.set_bus_volume_db(4, linear_to_db(value))
	HitMarkerVolume = value
	SaveSettings()
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
		if $Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Select_Speed.selected > 0 and $Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Select_Dificulty.selected > 0:
			$"Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Start_Level_2".disabled = false
		else:
			$"Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Start_Level_2".disabled = true
	elif $Level_Select/Right_Side/Level_3_Preview.visible == true:
		if $Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Select_Speed.selected > 0 and $Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Select_Dificulty.selected > 0:
			$"Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Start_Level_3".disabled = false
		else:
			$"Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Start_Level_3".disabled = true
#endregion
#region Start Level
func _on_start_level_1_pressed():
	$Button_SFX_Player.play()
	var speed = $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Speed.selected
	var difficulty = $Level_Select/Right_Side/Level_1_Preview/HBoxContainer2/Select_Dificulty.selected -1
	var Level = preload("res://Mixcylium/Prefabs/level_manager.tscn")
	var Scene = Level.instantiate()
	Scene.NoteSpeedModifier = speed *5
	Scene.Difficulty = difficulty
	Scene.Level_Number = 1
	add_child(Scene)
	$Level_Select/Right_Side/Level_1_Preview/Level_1_Preview_Player.stop()
	$Level_Select.visible = false

func _on_start_level_2_pressed():
	$Button_SFX_Player.play()
	var speed = $Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Select_Speed.selected 
	var difficulty = $Level_Select/Right_Side/Level_2_Preview/HBoxContainer2/Select_Dificulty.selected -1
	var Level = preload("res://Mixcylium/Prefabs/level_manager.tscn")
	var Scene = Level.instantiate()
	Scene.Difficulty = difficulty
	Scene.Level_Number = 2
	Scene.NoteSpeedModifier = speed *5
	add_child(Scene)
	$Level_Select/Right_Side/Level_2_Preview/Level_2_Preview_Player.stop()
	$Level_Select.visible = false

func _on_start_level_3_pressed():
	$Button_SFX_Player.play()
	var speed = $Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Select_Speed.selected
	var difficulty = $Level_Select/Right_Side/Level_3_Preview/HBoxContainer2/Select_Dificulty.selected -1
	var Level = preload("res://Mixcylium/Prefabs/level_manager.tscn")
	Level.Difficulty
	var Scene = Level.instantiate()
	Scene.Difficulty = difficulty
	Scene.Level_Number = 3
	Scene.NoteSpeedModifier = speed *5
	add_child(Scene)
	$Level_Select/Right_Side/Level_3_Preview/Level_3_Preview_Player.stop()
	$Level_Select.visible = false
#endregion
#endregion
