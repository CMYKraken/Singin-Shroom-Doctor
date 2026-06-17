using Godot;
using System;

public partial class RhythmManager : AudioStreamPlayer
{
	[Export]
	public int bpm { get; set; }= 120;
	[Export]
	public int BeatsPerBar = 4;
	[Export]
	public ESpeedModifier SpeedModifier {get;set;} = ESpeedModifier.Normal;

	//public LevelManager _levelManager;
	public Note[] _songNotes;

	private double _secondsPerBeat;

	private double _timeBegin;
	private double _timeDelay;

	private int _screenHeight;
	
	public enum ESpeedModifier{
		Half = 5,
		Normal = 10,
		NormalandaHalf = 15,
		Double = 20,
		DoubleandaHalf = 25,
		Triple = 30
	}

	public void _Init()
	{
		
	}
	//UPDATE TO USE SCORING ENUM AS RETURN VARIABLE
	public void CheckHitAccuracy()
	{
		// Get closest active note
		// Check if note is out of range 
		// Check note playback time against current playback time
		// determine and return a Perfect, good or miss 
	}

	
	public double GetCurrentPlaybackTime()
	{
		double time = (Time.GetTicksUsec() - _timeBegin) / 1000000.0d;
		time = Math.Max(0.0d,time - _timeDelay);
		GD.Print(string.Format("Time is: {0}",time));
		return time;
	}

	private void SpawnNote(){
		
	}


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_screenHeight = GetWindow().Size.Y;
		_secondsPerBeat = 60.0d / bpm;

		_timeBegin = Time.GetTicksUsec();
		_timeDelay = AudioServer.GetTimeToNextMix() + AudioServer.GetOutputLatency();
		this.Play();

		//_notes = _levelManager.getNotes();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		GetCurrentPlaybackTime();
	}

}
