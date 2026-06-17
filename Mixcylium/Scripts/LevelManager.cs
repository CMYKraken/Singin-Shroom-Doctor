using Godot;
using System;

public partial class LevelManager : Node3D
{
	public RhythmManager rhythmManager;
    int currentSceneNum;
    int levelMaxSceneNum;
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
		if (playerHealth < 0)
			Death();
	}

	void Death()
	{
		//Run the code to stop the current scene and display the loss screen
	}


    double currentSceneTimer;
    public override void _Process(double delta)
    {
		if (playerHealth > 0)
		{
			currentSceneTimer -= delta;
			CheckTimeStamp();
		}
    }
	void CheckTimeStamp()
	{
		if (rhythmManager.GetCurrentPlaybackTime() > currentSceneTimer)
        {           
			//Change data to next scene
            currentSceneNum++;
            currentSceneTimer = sceneTransitionTimeStamps[currentSceneNum];
            //Load the next scene and discard the previous
            GetChild(1).QueueFree();
            LoadNextScene(sceneOrder[currentSceneNum]);
        }
	}



    public enum SceneNames { PATIENT_TALK, SHROOM_PLANT, SHROOM_GROW, SHROOM_PROCESS, PILL_PROD, PILL_GIVE }
    [Export] double[] sceneTransitionTimeStamps;
    [Export] public Godot.Collections.Array<SceneNames> sceneOrder;
	[Export] public string[] sceneReferencePaths;
	//Loads the next scene based on the current scene & what that is set to in Scene Order
	void LoadNextScene(SceneNames sceneToLoad)
	{
		PackedScene sceneLoad = ResourceLoader.Load<PackedScene>(sceneReferencePaths[(int)sceneToLoad]);
        AddChild(sceneLoad.Instantiate());
    }
}
