using Godot;
using System;

public partial class Note : Sprite2D
{
	public int score;
	public double _time;
	private double _Speed;
	private bool stopped;
	private RhythmManager Rhythm;
	private NoteData.ECollumn _Lane;
	public Note(){}
	public Note(double movementSpeed,double noteTime, RhythmManager manager, NoteData.ECollumn Lane){
		Rhythm = manager;
		_Lane = Lane;
		_Speed = movementSpeed;
		_time = noteTime;
        stopped = false;
    }

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Texture = (Texture2D) ResourceLoader.Load("res://Mixcylium/ArtAssets/Sprites/Beats/GameJam.png");
		Scale = new Vector2(0.075f,0.075f);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (!stopped)
		{
            Position += Vector2.Down * (float)(_Speed * delta);
			if (_time - Rhythm.GetCurrentPlaybackTime() < -ScoringUtils.EarlyLateInterval)
			{
                Rhythm._chart.IncrementLanePointer(_Lane);
                DestroyNote(0);
            }
        }
	}

	public void DestroyNote(int worth){
        stopped = true;
		score = worth;
        PackedScene HitMarker = ResourceLoader.Load<PackedScene>("res://Mixcylium/Prefabs/hit_marker.tscn");
		AddChild(HitMarker.Instantiate());
		Texture = null;
	}
}
