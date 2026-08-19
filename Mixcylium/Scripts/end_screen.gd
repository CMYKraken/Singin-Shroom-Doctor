extends Control
var Grade
var GradeID
var Score
var Max_Score
var Score_Percent
var Difficulty
var Level_Number
var Death


func _ready():
	get_tree().paused = true
	Death = get_parent().Dead
	Difficulty = get_parent().Difficulty
	Level_Number = get_parent().Level_Number
	Score = get_parent().get_child(1).score
	Max_Score = (get_parent().noteData.beatColumn.size() * 555) * 3
	Score_Percent = float(float(Score)/float(Max_Score))
	print_debug(Max_Score)
	print_debug(Score_Percent)
	if Death != true:
		#Grading
		if Score_Percent >= 1:
			Grade = load("res://Mixcylium/ArtAssets/Grades/S++.png")
			GradeID = 7
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		elif Score_Percent < 1 and Score_Percent >= 0.9:
			Grade = load("res://Mixcylium/ArtAssets/Grades/S+.png")
			GradeID = 6
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		elif Score_Percent < 0.9 and Score_Percent >= 0.8:
			Grade = load("res://Mixcylium/ArtAssets/Grades/S.png")
			GradeID = 5
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		elif Score_Percent < 0.8 and Score_Percent >= 0.7:
			Grade = load("res://Mixcylium/ArtAssets/Grades/A.png")
			GradeID = 4
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		elif Score_Percent < 0.7 and Score_Percent >= 0.6:
			Grade = load("res://Mixcylium/ArtAssets/Grades/B.png")
			GradeID = 3
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		elif Score_Percent < 0.6 and Score_Percent >= 0.5:
			Grade = load("res://Mixcylium/ArtAssets/Grades/C.png")
			GradeID = 2
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		elif Score_Percent < 0.5 and Score_Percent >= 0.4:
			Grade = load("res://Mixcylium/ArtAssets/Grades/D.png")
			GradeID = 1
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		elif Score_Percent < 0.4:
			Grade = load("res://Mixcylium/ArtAssets/Grades/F.png")
			GradeID = 0
			$PanelContainer/VBoxContainer/TextureRect.texture = Grade
		
		
		if Score_Percent >= 0.4 and Score_Percent < 0.8:
			$PanelContainer/VBoxContainer/Win_Lose.text = "Win"
			$Win.play()
		elif Score_Percent >= 0.8:
			$PanelContainer/VBoxContainer/Win_Lose.text = "Epic Win"
			$Big_Win.play()
		else:
			$PanelContainer/VBoxContainer/Win_Lose.text = "Lose"
			$Lose.play()
		$PanelContainer/VBoxContainer/Score.text = str(Score)
		#Setting High Score
		match Difficulty:
			0:
				Difficulty = "Easy"
			1:
				Difficulty = "Medium"
			2:
				Difficulty = "Hard"
		
		if Score > get_parent().get_parent().ScoreData["Level_"+str(Level_Number)][Difficulty][0]:
			get_parent().get_parent().ScoreData["Level_"+str(Level_Number)][Difficulty][0] = Score
			get_parent().get_parent().ScoreData["Level_"+str(Level_Number)][Difficulty][1] = Grade
			get_parent().get_parent().ScoreData["Level_"+str(Level_Number)][Difficulty][2] = GradeID
			get_parent().get_parent().Update_Scores()
			get_parent().get_parent().Unlock_Check()
	else:
		$PanelContainer/VBoxContainer/Win_Lose.text = "You ran out of health"
		$Lose.play()
		$PanelContainer/VBoxContainer/Score.text = str(Score)
		$PanelContainer/VBoxContainer/TextureRect.texture = load("res://Mixcylium/ArtAssets/Grades/F.png") #Replace with sad mushroom or something to represent loss


func _on_back_to_menu_pressed():
	get_parent().get_parent().get_node("Level_Select").visible = true
	get_parent().get_parent().get_node("Level_Select/Right_Side/Level_"+str(get_parent().Level_Number)+"_Preview/Level_"+str(get_parent().Level_Number)+"_Preview_Player").play()
	get_tree().paused = false
	get_parent().queue_free()


func _on_replay_pressed():
	get_tree().get_root().get_child(0).call("_on_start_level_"+str(Level_Number)+"_pressed")
	get_tree().paused = false
	get_parent().queue_free()
