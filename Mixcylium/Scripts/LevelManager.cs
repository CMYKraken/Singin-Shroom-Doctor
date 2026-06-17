using Godot;
using System;

public partial class LevelManager : Node3D
{
	public RhythmManager rhythmManager;

	//Used by the Main Menu to start the level and pass in the correct levels
	public void OnInitialise()//Notes[] notes)
	{
		rhythmManager = (RhythmManager)GetChild(0).GetScript();
		//rhythmManager.OnInitialise(notes);
		sceneNum = 0;
		currentScene = LoadNextScene(sceneNum);
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



	float[] sceneTransitionTimeStamps;
	int sceneNum;
	Node3D currentScene;
	public void GetTimeStamp()
	{
		/*
		if (rhythmManager.TimeStamp() > sceneTransitionTimeStamps[sceneNum])
		{
			//Change data to next scene
			sceneNum++;
			//Load the next scene
			currentScene.Dispose();
			currentScene = LoadNextScene(sceneNum);
		}
		*/
	}



	public enum SceneNames { PATIENT_TALK, SHROOM_PLANT, SHROOM_GROW, SHROOM_PROCESS, PILL_PROD, PILL_GIVE }
	public SceneNames[] sceneOrder;
	//Loads the next scene based on the current scene & what that is set to in Scene Order
	Node3D LoadNextScene(int sceneNumToLoad)
	{
		switch (sceneOrder[sceneNumToLoad])
		{
			case SceneNames.PATIENT_TALK:
				return null; //load Patient Talk scene
			case SceneNames.SHROOM_PLANT:
				return null; //load Shroom Planting scene
			case SceneNames.SHROOM_GROW:
				return null; //load Shroom Growing scene
			case SceneNames.SHROOM_PROCESS:
				return null; //load Shroom Processing scene
			case SceneNames.PILL_PROD:
				return null; //load Pill Production scene
			case SceneNames.PILL_GIVE:
				return null; //load Pill Give scene
			default: 
				return null; //load Pill Give scene if we are giving an outside variable
		}
	}
}
