extends Control
var Grade
var Score
var Max_Score
var Score_Percent
var Difficulty
var Level_Number


func _ready():
	Difficulty = get_parent().Difficulty
	Level_Number = get_parent().Level_Number
	Score = get_parent().get_child(1).score
	Max_Score = get_parent().noteData.beatColumn.size() * 555
	Score_Percent = float(float(Score)/float(Max_Score))
	print_debug(Max_Score)
	print_debug(Score_Percent)
	#Grading
	if Score_Percent == 1:
		Grade = load("res://Mixcylium/ArtAssets/Grades/S++.png")
		$PanelContainer/VBoxContainer/TextureRect.texture = Grade
	elif Score_Percent < 1 and Score_Percent >= 0.9:
		Grade = load("res://Mixcylium/ArtAssets/Grades/S+.png")
		$PanelContainer/VBoxContainer/TextureRect.texture = Grade
	elif Score_Percent < 0.9 and Score_Percent >= 0.8:
		Grade = load("res://Mixcylium/ArtAssets/Grades/S.png")
		$PanelContainer/VBoxContainer/TextureRect.texture = Grade
	elif Score_Percent < 0.8 and Score_Percent >= 0.7:
		Grade = load("res://Mixcylium/ArtAssets/Grades/A.png")
		$PanelContainer/VBoxContainer/TextureRect.texture = Grade
	elif Score_Percent < 0.7 and Score_Percent >= 0.6:
		Grade = load("res://Mixcylium/ArtAssets/Grades/B.png")
		$PanelContainer/VBoxContainer/TextureRect.texture = Grade
	elif Score_Percent < 0.6 and Score_Percent >= 0.5:
		Grade = load("res://Mixcylium/ArtAssets/Grades/C.png")
		$PanelContainer/VBoxContainer/TextureRect.texture = Grade
	elif Score_Percent < 0.5 and Score_Percent >= 0.4:
		Grade = load("res://Mixcylium/ArtAssets/Grades/D.png")
		$PanelContainer/VBoxContainer/TextureRect.texture = Grade
	elif Score_Percent < 0.4:
		Grade = load("res://Mixcylium/ArtAssets/Grades/F.png")
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
		get_parent().get_parent().Update_Scores()



func _on_back_to_menu_pressed():
	get_parent().get_parent().get_node("Level_Select").visible = true
	get_parent().queue_free()
