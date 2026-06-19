using Godot;
using System;
using System.Diagnostics;

public partial class PlayerController : Node
{
    int score = 0;
	RhythmManager manager;
	public PlayerController(RhythmManager rhythm)
	{
        manager = rhythm;
    }

    public override void _Input(InputEvent @event)
    {
        if (@event.IsActionPressed("Action_1"))
        {
            GD.Print("D");
            score += manager.CheckHitAccuracy(NoteData.ECollumn.Zero);
        }
        if (@event.IsActionPressed("Action_2"))
        {
            GD.Print("F");
            score += manager.CheckHitAccuracy(NoteData.ECollumn.One);
        }
        if (@event.IsActionPressed("Action_3"))
        {
            GD.Print("J");
            score += manager.CheckHitAccuracy(NoteData.ECollumn.Two);
        }
        if (@event.IsActionPressed("Action_4"))
        {
            GD.Print("K");
            score += manager.CheckHitAccuracy(NoteData.ECollumn.Three);
        }
    }

}
