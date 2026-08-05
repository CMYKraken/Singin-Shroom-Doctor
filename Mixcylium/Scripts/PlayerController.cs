using Godot;
using System;
using System.Diagnostics;

public partial class PlayerController : Node
{
    public int score = 0;
    public int combo = 0;
    public int Maxcombo = 0;
    public double scoreMulti = 1;
	RhythmManager manager;
    ScoreLabel label;
	public PlayerController(RhythmManager rhythm)
	{
        manager = rhythm;
        PackedScene ScoreAndCombo = ResourceLoader.Load<PackedScene>("res://Mixcylium/Prefabs/score_and_combo_label.tscn");
        AddChild(ScoreAndCombo.Instantiate());
    }

    public override void _Process(double delta)
    {
        if (combo == 0)
        {
            scoreMulti = 1;
        }
        if (scoreMulti <= 5 && combo <= 40)
        {
            scoreMulti = (double)combo / 10f + 1f;
        }
        else if (scoreMulti <= 5 && combo > 40)
        {
            scoreMulti = 5;
        }
    }

    public override void _Input(InputEvent @event)
    {
        if (@event.IsActionPressed("Action_1"))
        {
            GD.Print("D");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.Zero);
            score += (int)((double)scorevalue * scoreMulti);
        }
        if (@event.IsActionPressed("Action_2"))
        {
            GD.Print("F");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.One);
            score += (int)((double)scorevalue * scoreMulti);
        }
        if (@event.IsActionPressed("Action_3"))
        {
            GD.Print("J");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.Two);
            score += (int)((double)scorevalue * scoreMulti);
        }
        if (@event.IsActionPressed("Action_4"))
        {
            GD.Print("K");
            int scorevalue = manager.CheckHitAccuracy(NoteData.ECollumn.Three);
            score += (int)((double)scorevalue * scoreMulti);
        }
    }
}
