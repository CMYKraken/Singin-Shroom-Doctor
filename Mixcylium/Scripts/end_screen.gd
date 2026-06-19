extends Control
var Grade
var Score
var Max_Score
var Score_Percent
var Difficulty
var Level_Number


func _ready():
	Score = get_parent().get_child(1).score
	Max_Score = 215 * 555
	Score_Percent = float(float(Score)/float(Max_Score))
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
	
	Difficulty = get_parent().Difficulty
	Level_Number = get_parent().Level_Number
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
	if Difficulty == 0 and Level_Number == 1:
		if Score > get_parent().get_parent().Easy1:
			get_parent().get_parent().Easy1 = Score
			get_parent().get_parent().Easy1IMG = Grade
			get_parent().get_parent().Update_Scores()
	elif Difficulty == 1 and Level_Number == 1:
		if Score > get_parent().get_parent().Medium1:
			get_parent().get_parent().Medium1 = Score
			get_parent().get_parent().Medium1IMG = Grade
			get_parent().get_parent().Update_Scores()
	elif Difficulty == 2 and Level_Number == 1:
		if Score > get_parent().get_parent().Hard1:
			get_parent().get_parent().Hard1 = Score
			get_parent().get_parent().Hard1IMG = Grade
			get_parent().get_parent().Update_Scores()
	elif Difficulty == 0 and Level_Number == 2:
		if Score > get_parent().get_parent().Easy2:
			get_parent().get_parent().Easy2 = Score
			get_parent().get_parent().Easy2IMG = Grade
			get_parent().get_parent().Update_Scores()
	elif Difficulty == 1 and Level_Number == 2:
		if Score > get_parent().get_parent().Medium2:
			get_parent().get_parent().Medium2 = Score
			get_parent().get_parent().Medium2IMG = Grade
			get_parent().get_parent().Update_Scores()
	elif Difficulty == 2 and Level_Number == 2:
		if Score > get_parent().get_parent().Hard2:
			get_parent().get_parent().Hard2 = Score
			get_parent().get_parent().Hard2IMG = Grade
			get_parent().get_parent().Update_Scores()
	elif Difficulty == 0 and Level_Number == 3:
		if Score > get_parent().get_parent().Easy3:
			get_parent().get_parent().Easy3 = Score
			get_parent().get_parent().Easy3IMG = Grade
			get_parent().get_parent().Update_Scores()
	if Difficulty == 1 and Level_Number == 3:
		if Score > get_parent().get_parent().Medium3:
			get_parent().get_parent().Medium3 = Score
			get_parent().get_parent().Medium3IMG = Grade
			get_parent().get_parent().Update_Scores()
	if Difficulty == 2 and Level_Number == 3:
		if Score > get_parent().get_parent().Hard3:
			get_parent().get_parent().Hard3 = Score
			get_parent().get_parent().Hard3IMG = Grade
			get_parent().get_parent().Update_Scores()


func _on_back_to_menu_pressed():
	get_parent().get_parent().get_node("Level_Select").visible = true
	get_parent().queue_free()
