using Godot;
using System;
using System.Diagnostics;

public partial class PlayerController : Node
{
    public int score = 0;
	RhythmManager manager;
    ScoreLabel label;
	public PlayerController(RhythmManager rhythm)
	{
        manager = rhythm;
        label = new();
        AddChild(label);
    }

    public override void _Input(InputEvent @event)
    {
        if (@event.IsActionPressed("Action_1"))
        {
            GD.Print("D");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.Zero);
            score += scorevalue;
        }
        if (@event.IsActionPressed("Action_2"))
        {
            GD.Print("F");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.One);
            score += scorevalue;
        }
        if (@event.IsActionPressed("Action_3"))
        {
            GD.Print("J");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.Two);
            score += scorevalue;

        }
        if (@event.IsActionPressed("Action_4"))
        {
            GD.Print("K");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.Three);
            score += scorevalue;
            
        }
    }

}
