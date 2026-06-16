using Godot;
using System;

public partial class RhythmManager : Node3D
{

	//public LevelManager _levelManager;
	//Private Notes _notes;
	private double _timeBegin;
	private double _timeDelay;

	//UPDATE TO USE SCORING ENUM AS RETURN VARIABLE
	public void CheckHitAccuracy()
	{
		// Get closest active note
		// Check if note is out of range 
		// Check note playback time against current playback time
		// determine and return a Perfect, good or miss 
	}

	
	private void GetCurrentPlaybackTime()
	{
		double time = (Time.GetTicksUsec() - _timeBegin) / 1000000.0d;
		time = Math.Max(0.0d,time - _timeDelay);
		GD.Print(string.Format("Time is: {0}",time));
	}

	private void UpdateRhythmObjects()
	{
		//Move the objects on the screen to the rhythm 
	}

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_timeBegin = Time.GetTicksUsec();
		_timeDelay = AudioServer.GetTimeToNextMix() + AudioServer.GetOutputLatency();
		GetNode<AudioStreamPlayer>("Player").Play();

		//_notes = _levelManager.getNotes();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		GetCurrentPlaybackTime();
		UpdateRhythmObjects();
	}

}
