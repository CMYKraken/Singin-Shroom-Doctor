using Godot;
using System;

public partial class Note : Sprite2D
{
	public double _time;
	private double _Speed;
	public Note(){}
	public Note(double movementSpeed,double noteTime){
		_Speed = movementSpeed;
		_time = noteTime;
	}

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Texture = (Texture2D) ResourceLoader.Load("res://Mixcylium/ArtAssets/Sprites/Beats/Half_Beat.png");
		Scale = new Vector2(0.75f,0.75f);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Position += Vector2.Down * (float)(_Speed * delta);
	}

	public void DestroyNote(){
		Visible = false;
	}
}
