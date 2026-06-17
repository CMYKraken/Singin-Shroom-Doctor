using Godot;
using System;
using System.Linq;

public partial class Chart : Node2D
{
	public Note[] Collumn0 ,Collumn1, Collumn2, Collumn3;
	//Used for spawn offset on the X axis
	public int Collumn0Xposition,Collumn1Xposition,Collumn2Xposition,Collumn3Xposition;

	private double _noteSpeed;

	public Chart(){}
	public Chart(double InNoteSpeed)
	{
		_noteSpeed = InNoteSpeed;
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
		
		switch ((int)CollumnId)
		{
			case 0:
				Collumn0.Append(newNote);
				newNote.Position += Vector2.Left* 30;
			break;
			case 1:
				Collumn1.Append(newNote);
				newNote.Position += Vector2.Left* 10;
			break;
			case 2:
				Collumn2.Append(newNote);
				newNote.Position += Vector2.Right* 10;
			break;
			case 3: 
				Collumn3.Append(newNote);
				newNote.Position += Vector2.Right* 30;
			break;
		}
	}

}
