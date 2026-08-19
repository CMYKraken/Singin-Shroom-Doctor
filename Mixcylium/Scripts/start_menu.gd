extends Control

var Input1
var Input2
var Input3
var Input4
var Pause
var MasterVolume = 0.75
var SFXVolume = 0.75
var MusicVolume = 0.75
var MusicBeatsVolume = 0.75
var HitMarkerVolume = 0.75
var ConfigScore = ConfigFile.new()
var ConfigSetting = ConfigFile.new()
var ConfigSecret = ConfigFile.new()
var SecretCount = 5
var LevelCount = 20
var LevelSet = 4
var SecretData = {
	"Secret_1":false,
	"Secret_2":false,
	"Secret_3":false,
	"Secret_4":false,
	"Secret_5":false
	}
var ScoreData = {
	"Level_1":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_2":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_3":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_4":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_5":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_6":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_7":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_8":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_9":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_10":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_11":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_12":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_13":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_14":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_15":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_16":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_17":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_18":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_19":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]},
	"Level_20":{"Easy":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Medium":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0],"Hard":[0,load("res://Mixcylium/ArtAssets/Grades/F.png"),0,0]}
	}


func _ready():
	LoadSettings()
	LoadScore()
	LoadSecret()
	Update_Volume()
	Update_Scores()
	Unlock_Check()
	$Settings_Menu/Controls_Settings/Input_1_Container/Label.text = InputMap.action_get_events("Action_1")[0].as_text()
	$Settings_Menu/Controls_Settings/Input_2_Container/Label.text = InputMap.action_get_events("Action_2")[0].as_text()
	$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = InputMap.action_get_events("Action_3")[0].as_text()
	$Settings_Menu/Controls_Settings/Input_4_Container/Label.text = InputMap.action_get_events("Action_4")[0].as_text()
	$Settings_Menu/Controls_Settings/Pause_Container/Label.text = InputMap.action_get_events("Pause")[0].as_text()
	$Main_Menu.visible = true
	$Level_Select.visible = false
	$Settings_Menu.visible = false
	$Settings_Menu/Settings_Main.visible = false
	$Settings_Menu/General_Settings.visible = false
	$Settings_Menu/Volume_Settings.visible = false
	$Settings_Menu/Controls_Settings.visible = false
	for i in LevelCount:
		get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview").visible = false
	$Level_Select/Right_Side/Level_1_Preview.visible = true


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
	ConfigSetting.set_value("Controls","Pause", InputMap.action_get_events("Pause")[0])
	
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
			InputMap.action_erase_events("Pause")
			InputMap.action_add_event("Pause",ConfigSetting.get_value("Controls","Pause"))
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
			ConfigScore.set_value("Level_"+str(I+1)+Diff, "Level_grade_id", ScoreData["Level_"+str(I+1)][Diff][2])
			ConfigScore.set_value("Level_"+str(I+1)+Diff, "Level_combo", ScoreData["Level_"+str(I+1)][Diff][3])
	ConfigScore.save("user://scores.cfg")

func LoadScore():
	var ScoreFile = ConfigScore.load("user://scores.cfg")
	if ScoreFile != OK:
		return
	for level in ConfigScore.get_sections():
		var LevelName = ConfigScore.get_value(level,"Level_name",0)
		var LevelDiff = ConfigScore.get_value(level, "Level_difficulty",0)
		var LevelScore = ConfigScore.get_value(level, "Level_score",0)
		var LevelGrade = ConfigScore.get_value(level, "Level_grade",0)
		var LevelGradeID = ConfigScore.get_value(level, "Level_grade_id",0)
		var LevelCombo = ConfigScore.get_value(level, "Level_combo",0)
		var LevelDict = {LevelDiff: [LevelScore,LevelGrade,LevelGradeID,LevelCombo]}
		ScoreData[LevelName].merge(LevelDict, true)

func Update_Scores():
	for I in LevelCount:
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel/Score").text = str(ScoreData["Level_"+str(I+1)]["Easy"][0])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel2/Score").text = str(ScoreData["Level_"+str(I+1)]["Medium"][0])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel3/Score").text = str(ScoreData["Level_"+str(I+1)]["Hard"][0])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel/Rank").texture = ScoreData["Level_"+str(I+1)]["Easy"][1]
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel2/Rank").texture = ScoreData["Level_"+str(I+1)]["Medium"][1]
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel3/Rank").texture = ScoreData["Level_"+str(I+1)]["Hard"][1]
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel/Max_Combo").text = str(ScoreData["Level_"+str(I+1)]["Easy"][3])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel2/Max_Combo").text = str(ScoreData["Level_"+str(I+1)]["Medium"][3])
		get_node("Level_Select/Right_Side/Level_"+str(I+1)+"_Preview/HBoxContainer/Panel3/Max_Combo").text = str(ScoreData["Level_"+str(I+1)]["Hard"][3])
	SaveScore()
	print_debug("Updated")
#endregion
#region Secrets
func SaveSecret():
	for i in SecretCount:
		ConfigSecret.set_value("Secret",str(i),SecretData.get("Secret"+str(i+1)))
	ConfigSecret.save("user://secret.cfg")

func LoadSecret():
	var SecretFile = ConfigScore.load("user://secret.cfg")
	if SecretFile != OK:
		return
	for i in SecretCount:
		var SecretVal = ConfigSecret.get_value("Secret",str(i),0)
		var SecretDict = {"Secret_"+str(i+1):SecretVal}
		SecretData.merge(SecretDict, true)

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
	if Pause == true:
		InputMap.action_erase_events("Pause")
		if CheckConflict(event) == false:
			InputMap.action_add_event("Pause",event)
			$Settings_Menu/Controls_Settings/Pause_Container/Label.text =  event.as_text()
			Pause = false
			SaveSettings()
		else:
			$Settings_Menu/Controls_Settings/Pause_Container/Label.text = "Key Already Bound"

func CheckConflict(Action):
	if InputMap.action_has_event("Action_1", Action):
		return true
	if InputMap.action_has_event("Action_2", Action):
		return true
	if InputMap.action_has_event("Action_3", Action):
		return true
	if InputMap.action_has_event("Action_4", Action):
		return true
	if InputMap.action_has_event("Pause", Action):
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
			DisplayServer.window_set_mode(0)
		1:
			DisplayServer.window_set_mode(3)

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

func _on_input_3_pressed():
	$Button_SFX_Player.play()
	Input3 = true
	$Settings_Menu/Controls_Settings/Input_3_Container/Label.text = ""

func _on_input_4_pressed():
	$Button_SFX_Player.play()
	Input4 = true
	$Settings_Menu/Controls_Settings/Input_4_Container/Label.text = ""

func _on_pause_pressed():
	$Button_SFX_Player.play()
	Pause = true
	$Settings_Menu/Controls_Settings/Pause_Container/Label.text = ""
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
func _on_level_pressed(type : int):
	$Button_SFX_Player.play()
	for i in LevelCount:
		if i == type -1:
			get_node("Level_Select/Right_Side/Level_"+str(type)+"_Preview").visible = true
			get_node("Level_Select/Right_Side/Level_"+str(type)+"_Preview/Level_"+str(type)+"_Preview_Player").play()
		else:
			get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview").visible = false
			get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview/Level_"+str(i+1)+"_Preview_Player").stop()
#endregion
#region Button Check
func Button_Check():
	for i in LevelCount:
		if get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview").visible == true:
			if get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview/HBoxContainer2/Select_Speed").selected > 0 and get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview/HBoxContainer2/Select_Dificulty").selected > 0:
				get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview/HBoxContainer2/Start_Level_"+str(i+1)).disabled = false
			else:
				get_node("Level_Select/Right_Side/Level_"+str(i+1)+"_Preview/HBoxContainer2/Start_Level_"+str(i+1)).disabled = true

#endregion
#region Start Level
func _on_start_level_pressed(type: int):
	$Button_SFX_Player.play()
	var speed = get_node("Level_Select/Right_Side/Level_"+str(type)+"_Preview/HBoxContainer2/Select_Speed").selected
	var difficulty = get_node("Level_Select/Right_Side/Level_"+str(type)+"_Preview/HBoxContainer2/Select_Dificulty").selected -1
	var Level = preload("res://Mixcylium/Prefabs/level_manager.tscn")
	var Scene = Level.instantiate()
	Scene.NoteSpeedModifier = speed *5
	Scene.Difficulty = difficulty
	Scene.Level_Number = type
	add_child(Scene)
	get_node("Level_Select/Right_Side/Level_"+str(type)+"_Preview/Level_"+str(type)+"_Preview_Player").stop()
	$Level_Select.visible = false
#endregion
#endregion
#region Level Progression
func Unlock_Check():
	for i in LevelSet:
		var p = 3*(i+2)
		var l1 = false 
		var l2 = false
		var l3 = false
		if ScoreData["Level_"+str(i+1)]["Easy"][2] > 0 or ScoreData["Level_"+str(i+1)]["Medium"][2] > 0 or ScoreData["Level_"+str(i+1)]["Hard"][2] > 0:
			l1 = true
		if ScoreData["Level_"+str(i+2)]["Easy"][2] > 0 or ScoreData["Level_"+str(i+2)]["Medium"][2] > 0 or ScoreData["Level_"+str(i+2)]["Hard"][2] > 0:
			l2 = true
		if ScoreData["Level_"+str(i+3)]["Easy"][2] > 0 or ScoreData["Level_"+str(i+3)]["Medium"][2] > 0 or ScoreData["Level_"+str(i+3)]["Hard"][2] > 0:
			l3 = true
		if l1 and l2 and l3:
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(p-2)).disabled = false
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(p-1)).disabled = false
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(p)).disabled = false
		else:
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(p-2)).disabled = true
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(p-1)).disabled = true
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(p)).disabled = true
	
	for d in SecretCount:
		if SecretData.get("Secret_"+str(d+1)):
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(d+16)).visible = true
		else:
			get_node("Level_Select/Left_Side/Level_Options/ScrollContainer/VBoxContainer/Level_"+str(d+16)).visible = false
#endregion
