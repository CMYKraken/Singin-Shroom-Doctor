using Godot;
using System;
using System.Linq;

public partial class Chart : Node2D
{
	public Godot.Collections.Array<Note> Collumn0 ,Collumn1, Collumn2, Collumn3;
	//Used for spawn offset on the X axis
	public int Collumn0Xposition,Collumn1Xposition,Collumn2Xposition,Collumn3Xposition;

	private double _noteSpeed;

	public Chart()
	{
		Collumn0 = new Godot.Collections.Array<Note>();
		Collumn1 = new Godot.Collections.Array<Note>();
		Collumn2 = new Godot.Collections.Array<Note>();
		Collumn3 = new Godot.Collections.Array<Note>();
	}
	public Chart(double InNoteSpeed)
	{
		_noteSpeed = InNoteSpeed;

		Collumn0 = new Godot.Collections.Array<Note>();
		Collumn1 = new Godot.Collections.Array<Note>();
		Collumn2 = new Godot.Collections.Array<Note>();
		Collumn3 = new Godot.Collections.Array<Note>();
	}

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GD.Print("Chart Ready");
		GD.Print("Note speed is: {0}",_noteSpeed);

		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void CreateNoteInCollumn(NoteData.ECollumn CollumnId)
	{
		Note newNote = new(_noteSpeed);
		
		AddChild(newNote);

		newNote.Position = Vector2.Up *100;
		
		switch (CollumnId)
		{
			case NoteData.ECollumn.Zero:
				Collumn0.Add(newNote);
				newNote.Position += Vector2.Left* 30;
			break;
			case NoteData.ECollumn.One:
				Collumn1.Add(newNote);
				newNote.Position += Vector2.Left* 10;
			break;
			case NoteData.ECollumn.Two:
				Collumn2.Add(newNote);
				newNote.Position += Vector2.Right* 10;
			break;
			case NoteData.ECollumn.Three: 
				Collumn3.Add(newNote);
				newNote.Position += Vector2.Right* 30;
			break;
		}
	}

}
