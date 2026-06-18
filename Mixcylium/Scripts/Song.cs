using Godot;
using System;

public partial class Song : Resource
{
	[Export] public AudioStream Audio;
	[Export] public int BeatsPerBar;
	[Export] public int bpm;
}
	