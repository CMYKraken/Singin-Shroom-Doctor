using Godot;
using System;

public partial class RhythmManager : Node3D
{
	private double _timeBegin;
	private double _timeDelay;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_timeBegin = Time.GetTicksUsec();
		_timeDelay = AudioServer.GetTimeToNextMix() + AudioServer.GetOutputLatency();
		GetNode<AudioStreamPlayer>("Player").Play();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		double time = (Time.GetTicksUsec() - _timeBegin) / 1000000.0d;
		time = Math.Max(0.0d,time - _timeDelay);
		GD.Print(string.Format("Time is: {0}",time));
	}
}
