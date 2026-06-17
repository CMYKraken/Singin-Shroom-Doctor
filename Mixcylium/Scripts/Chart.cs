using Godot;
using System;
using System.Linq;

public partial class Chart : Node2D
{
	public Note[] Collumn0 ,Collumn1, Collumn2, Collumn3;
	//Used for spawn offset on the X axis
	public int Collumn0Xposition,Collumn1Xposition,Collumn2Xposition,Collumn3Xposition;
	public RhythmManager.ESpeedModifier speedModifier;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void CreateNoteInCollumn(double speed,NoteData.ECollumn CollumnId)
	{
		Note newNote = new(speed);
		AddChild(newNote);
		switch ((int)CollumnId)
		{
			case 0: Collumn0.Append(newNote);
			break;
			case 1: Collumn1.Append(newNote);
			break;
			case 2: Collumn2.Append(newNote);
			break;
			case 3: Collumn3.Append(newNote);
			break;
		}
	}

}
