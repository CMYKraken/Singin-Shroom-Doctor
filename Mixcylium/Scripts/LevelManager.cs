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
		rhythmManager = new(currentSong,noteData,NoteSpeedModifier);
		AddChild(rhythmManager);
		player = new(rhythmManager);
		AddChild(player);
		//rhythmManager = GetNode<RhythmManager>(GetChild(0).GetPath());
		//rhythmManager.OnInitialise(notes);
		currentSceneNum = 0;
		levelMaxSceneNum = sceneOrder.Count;
        currentSceneTimer = sceneTransitionTimeStamps[currentSceneNum];
        LoadNextScene(sceneOrder[currentSceneNum]);
	}

	float playerHealth = 1;
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
				if (currentSceneNum < levelMaxSceneNum)
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
		PackedScene EndScreen = ResourceLoader.Load<PackedScene>("res://Mixcylium/Prefabs/end_screen.tscn");
		AddChild(EndScreen.Instantiate());
		Stopper = true;
    }

	private bool Stopper = false;
	public int Difficulty;
	public int Level_Number;
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
