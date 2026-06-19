using Godot;
using System;
using System.ComponentModel;

public partial class ScoreLabel : Label
{
	private PlayerController player;

	private Sprite2D BackgroundBox;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		player = (PlayerController) GetParent();
		BackgroundBox = new();
		BackgroundBox.Texture = (Texture2D) ResourceLoader.Load("res://Mixcylium/ArtAssets/GUI/Temp/Black.png");
		BackgroundBox.ShowBehindParent = true;
		Position = Vector2.Zero;
		Scale *= 2;
		AddChild(BackgroundBox);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Text = player.score.ToString();
	}
}
