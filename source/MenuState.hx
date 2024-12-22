package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

using StringTools;

class MenuState extends FlxState
{
	var text:FlxText = new FlxText(0, 0, 0, "", 16);

	override function create()
	{
		add(text);
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ANY)
		{
			if (!FlxG.keys.justReleased.ESCAPE)
			{
				for (key in FlxG.keys.getIsDown())
				{
					updateText(text.text + key);
				}
			}
		}

		super.update(elapsed);
	}

	function updateText(setText:String)
	{
		text.text = setText;
		text.screenCenter();
	}
}
