using Godot;
using System;

public partial class NoteData : Node
{
	public double beatTimestamp;

	public ECollumn beatColumn;

	public enum ECollumn
	{
		Zero = 0,
		One = 1,
		Two = 2,
		Three = 3
	}
}
