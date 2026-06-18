using Godot;
using System;

public partial class Note : Sprite2D
{
	private double _Speed;
	public Note(){}
	public Note(double movementSpeed){
		_Speed = movementSpeed;
	}

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Texture = (Texture2D) ResourceLoader.Load("res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Position += Vector2.Down * (float)(_Speed * delta);
	}

	public void DestroyNote(double timedelay){
		
	}
}
