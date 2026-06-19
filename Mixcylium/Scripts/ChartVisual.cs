using Godot;
using System;

public partial class ChartVisual : Node2D
{
	[Export] public int beatBarHeight = 100;
	[Export] public int beatBarWidth = 500;
	private Label[] labels;
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

		labels = new Label[4];
		labels[0]= new();labels[1]= new();labels[2]= new();labels[3]= new();
		labels[0].Position = _beatBar.Position + (Vector2.Left * 3/8 * beatBarWidth) +Vector2.Down* beatBarHeight/2;
		labels[1].Position = _beatBar.Position + (Vector2.Left * 1/8 * beatBarWidth)+Vector2.Down* beatBarHeight/2;
		labels[2].Position = _beatBar.Position + (Vector2.Right * 1/8 * beatBarWidth)+Vector2.Down* beatBarHeight/2;
		labels[3].Position = _beatBar.Position + (Vector2.Right * 3/8 * beatBarWidth)+Vector2.Down* beatBarHeight/2;

		labels[0].Text = "D";labels[1].Text = "F";labels[2].Text = "J";labels[3].Text = "K";

		foreach(Label label in labels)
		{
			label.Scale*=2;
			AddChild(label);
		}

		Chart.SpawnHeight = beatBarHeight; 
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
