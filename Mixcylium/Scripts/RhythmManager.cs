using Godot;
using System;
using System.Linq;

public partial class RhythmManager : AudioStreamPlayer
{
	[Export]
	public int bpm { get; set; } = 120;
	[Export]
	public int BeatsPerBar = 4;
	[Export]
	public ESpeedModifier SpeedModifier {get;set;} = ESpeedModifier.Normal;

	//public LevelManager _levelManager;
	public NoteData _noteData;

	public Chart _chart;

	private int _noteSpawnerPos;
	private int _noteCheckerPos;
	private int _screenHeight;
	private double CurrentPlaybackTime;
	private double _BeatsPerSecond;
	private double _SpeedCoefficient;
	private double _noteSpeed;
	private double _timeBegin;
	private double _timeDelay;
	
	
	public enum ESpeedModifier{
		Half = 5,
		Normal = 10,
		NormalandaHalf = 15,
		Double = 20,
		DoubleandaHalf = 25,
		Triple = 30
	}
	
	public RhythmManager()
	{
		
	}

	public RhythmManager(NoteData allNoteData,ESpeedModifier speedModifier)
	{
		_noteData = allNoteData;
		SpeedModifier = speedModifier;
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
		GD.Print(string.Format("playback: {0}",time));
		return time;

	}
	private void CheckNextNoteToSpawn()
	{
		if(_noteData.beatTimestamp.Count()<= _noteSpawnerPos) return;
		
		if(CurrentPlaybackTime >= _noteData.beatTimestamp[_noteSpawnerPos])
		{
			SpawnNote(_noteData.beatColumn[_noteSpawnerPos]);
			_noteSpawnerPos++;
			CheckNextNoteToSpawn();
		}
	}

	private void SpawnNote(NoteData.ECollumn collumn){
		_chart.CreateNoteInCollumn(collumn);
	}


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		

		_screenHeight = GetWindow().Size.Y;
		_BeatsPerSecond = bpm/ 60.0d;
		_SpeedCoefficient = BeatsPerBar*1/((double)SpeedModifier/10);
		_noteSpeed = _screenHeight*_BeatsPerSecond/_SpeedCoefficient;

		_chart = new(_noteSpeed);

		_timeBegin = Time.GetTicksUsec();
		_timeDelay = AudioServer.GetTimeToNextMix() + AudioServer.GetOutputLatency();
		this.Play();

		//_notes = _levelManager.getNoteData();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		CurrentPlaybackTime = GetCurrentPlaybackTime();
		CheckNextNoteToSpawn();
	}

}
