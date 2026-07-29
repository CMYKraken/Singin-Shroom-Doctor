using Godot;
using System;

public partial class LevelManager : Node3D
{
	public RhythmManager rhythmManager;
	public PlayerController player;
	int currentSceneNum;
	int levelMaxSceneNum;
	
	//Used by the Main Menu to start the level and pass in the correct levels
	public void OnInitialise()//Notes[] notes)
	{
		if (Difficulty == 0)
		{
            currentSong = ResourceLoader.Load<Song>("res://Mixcylium/Songs/Song"+Level_Number.ToString()+"E.tres");
            noteData = ResourceLoader.Load<NoteData>("res://Mixcylium/Notes/Level"+Level_Number.ToString()+"E.tres");
        }
        if (Difficulty == 1)
        {
            currentSong = ResourceLoader.Load<Song>("res://Mixcylium/Songs/Song" + Level_Number.ToString() + "M.tres");
            noteData = ResourceLoader.Load<NoteData>("res://Mixcylium/Notes/Level" + Level_Number.ToString() + "M.tres");
        }
        if (Difficulty == 2)
        {
            currentSong = ResourceLoader.Load<Song>("res://Mixcylium/Songs/Song" + Level_Number.ToString() + "H.tres");
            noteData = ResourceLoader.Load<NoteData>("res://Mixcylium/Notes/Level" + Level_Number.ToString() + "H.tres");
        }
        rhythmManager = new(currentSong,noteData,NoteSpeedModifier);
		AddChild(rhythmManager);
		player = new(rhythmManager);
		AddChild(player);
        PackedScene HealthBar = ResourceLoader.Load<PackedScene>("res://Mixcylium/Prefabs/health_bar.tscn");
        AddChild(HealthBar.Instantiate());
        PackedScene PauseMenu = ResourceLoader.Load<PackedScene>("res://Mixcylium/Prefabs/pause_menu.tscn");
        AddChild(PauseMenu.Instantiate());
        //rhythmManager = GetNode<RhythmManager>(GetChild(0).GetPath());
        //rhythmManager.OnInitialise(notes);
        currentSceneNum = 0;
		levelMaxSceneNum = sceneOrder.Count;
        currentSceneTimer = sceneTransitionTimeStamps[currentSceneNum];
        LoadNextScene(sceneOrder[currentSceneNum]);
        
    }

	float playerHealth = 25;
	public float GetHealth()
	{
		return playerHealth;
	}
	//Can be Positive or Negative based on Dmg or Health regen
	public void SetHealth(float healthChange)
	{
		playerHealth += healthChange;
		if (playerHealth < 0)
			Death();
	}

	void Death()
	{
		Dead = true;
		PackedScene EndScreen = ResourceLoader.Load<PackedScene>("res://Mixcylium/Prefabs/end_screen.tscn");
		AddChild(EndScreen.Instantiate());
		//Run the code to stop the current scene and display the loss screen
	}

    public override void _Ready()
    {
        OnInitialise();
    }


	double currentSceneTimer;
	public override void _Process(double delta)
	{
		if (playerHealth > 0)
		{
			//currentSceneTimer -= delta;
			CheckTimeStamp();
		}
	}
	void CheckTimeStamp()
	{
		if (Stopper == false)
		{
			if (rhythmManager.GetCurrentPlaybackTime() > currentSceneTimer)
			{
				if (currentSceneNum < levelMaxSceneNum - 1)
				{
					//Change data to next scene
					currentSceneNum++;
					currentSceneTimer = sceneTransitionTimeStamps[currentSceneNum];
					//Load the next scene and discard the previous
					GetChild(-1).QueueFree();
					LoadNextScene(sceneOrder[currentSceneNum]);
				}
				else
				{
					END();
				}
			}
		}
	}

	void END()
	{
		Dead = false;
		PackedScene EndScreen = ResourceLoader.Load<PackedScene>("res://Mixcylium/Prefabs/end_screen.tscn");
		AddChild(EndScreen.Instantiate());
		Stopper = true;
    }

	private bool Stopper = false;
	public int Difficulty;
	public int Level_Number;
	public bool Dead;
	public enum SceneNames { consultation, mushroom_growing_1, mushroom_growing_2, mushroom_growing_3, mortar_and_pestle, pill_delivery }
	[Export] double[] sceneTransitionTimeStamps;
	[Export] public Godot.Collections.Array<SceneNames> sceneOrder;
	[Export] public string[] sceneReferencePaths;
	[Export] public Song currentSong;
	[Export] public NoteData noteData;
	[Export] public RhythmManager.ESpeedModifier NoteSpeedModifier;
	//Loads the next scene based on the current scene & what that is set to in Scene Order
	void LoadNextScene(SceneNames sceneToLoad)
	{
		PackedScene sceneLoad = ResourceLoader.Load<PackedScene>(sceneReferencePaths[(int)sceneToLoad]);
		AddChild(sceneLoad.Instantiate());
	}
}
