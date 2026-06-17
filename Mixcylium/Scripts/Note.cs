using Godot;
using System;

public partial class Note : Node2D
{
	private double _Speed;
	public Note(){}
	public Note(double movementSpeed){
		_Speed = movementSpeed;
	}

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GD.Print("Note Spawned");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Position += Vector2.Down * (float)(_Speed * delta);
	}

	public void DestroyNote(double timedelay){
		
	}
}
