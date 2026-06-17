using Godot;
using System;

public partial class LevelManager : Node3D
{
	public RhythmManager rhythmManager;

	//Used by the Main Menu to start the level and pass in the correct levels
	public void OnInitialise()//Notes[] notes)
	{
		rhythmManager = GetNode<RhythmManager>(GetChild(0).GetPath());
		//rhythmManager.OnInitialise(notes);
		currentSceneNum = 0;
		levelMaxSceneNum = sceneOrder.Count;
		LoadNextScene(sceneOrder[currentSceneNum]);
    }


	float playerHealth;
	public float GetHealth()
	{
		return playerHealth;
	}
	//Can be Positive or Negative based on Dmg or Health regen
	public void SetHealth(float healthChange)
	{
		playerHealth += healthChange;
	}

	double timer;
    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Ready()
    {
		timer = 10;
		OnInitialise();
    }
    public override void _Process(double delta)
    {
        timer -= delta;
        if (timer <= 0 && currentSceneNum < levelMaxSceneNum)
		{
			timer = 10;
			//Change data to next scene
			currentSceneNum++;
			//Load the next scene
			GetChild(1).QueueFree();
			LoadNextScene(sceneOrder[currentSceneNum]);
        }
    }


    float[] sceneTransitionTimeStamps;
	int currentSceneNum;
	int levelMaxSceneNum;
    /*
	public void GetTimeStamp()
	{
		if (rhythmManager.TimeStamp() > sceneTransitionTimeStamps[sceneNum])
		{
			//Change data to next scene
			sceneNum++;
			//Load the next scene
			currentScene.Dispose();
			currentScene = LoadNextScene(sceneOrder[currentSceneNum]);
		}
	}
	*/

    public enum SceneNames { PATIENT_TALK = 0, SHROOM_PLANT = 1, SHROOM_GROW = 2, SHROOM_PROCESS = 3, PILL_PROD = 4, PILL_GIVE = 5 }
	[Export] public Godot.Collections.Array<SceneNames> sceneOrder;
	[Export] public string[] sceneReferencePaths;
	//Loads the next scene based on the current scene & what that is set to in Scene Order
	void LoadNextScene(SceneNames sceneToLoad)
	{
		PackedScene sceneLoad = ResourceLoader.Load<PackedScene>(sceneReferencePaths[(int)sceneToLoad]);
        AddChild(sceneLoad.Instantiate());
    }
}
