using Godot;
using System;

public partial class NoteData : Resource
{
	[Export] public double[] beatTimestamp;

	[Export] public Godot.Collections.Array<ECollumn> beatColumn;

	public enum ECollumn
	{
		Zero = 0,
		One = 1,
		Two = 2,
		Three = 3
	}
}
