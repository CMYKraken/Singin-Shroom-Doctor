using Godot;
using System;

public partial class ChartVisual : Node2D
{
	[Export] public int beatBarHeight = 100;
	[Export] public int beatBarWidth = 500;
	
	private Vector2I _screenSize;
	private Line2D _beatBar;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_screenSize = GetWindow().Size;

		_beatBar = new();
		_beatBar.Name = "ScoringBar";
		_beatBar.AddPoint(Vector2.Left*beatBarWidth/2);
		_beatBar.AddPoint(Vector2.Right*beatBarWidth/2);
		_beatBar.Position = (Vector2.Right *_screenSize.X/2) + (Vector2.Down *(_screenSize.Y - beatBarHeight));

		AddChild(_beatBar);

		Chart.SpawnHeight = beatBarHeight; 
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
