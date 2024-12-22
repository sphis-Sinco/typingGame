package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;

using StringTools;

class TypingState extends FlxState
{
	public var text:FlxText = new FlxText(0, 0, 0, "", 16);

	var CAN_TYPE:Bool = true;

	override public function new(typeable:Bool = true)
	{
		super();

		CAN_TYPE = typeable;
	}

	override function create()
	{
		add(text);
		super.create();
	}

	private var keys:Array<FlxKey> = [
        // letters
		A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z,
        // special letters: numbers
        ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, ZERO,
        NUMPADONE, NUMPADTWO, NUMPADTHREE, NUMPADFOUR, NUMPADFIVE, NUMPADSIX, NUMPADSEVEN, NUMPADEIGHT, NUMPADNINE, NUMPADZERO,
        // special letters: symbols(?)
        SPACE,PERIOD, GRAVEACCENT, SLASH,LBRACKET,
        NUMPADPERIOD,BACKSLASH,RBRACKET
	];

    private var specialLetters:Map<FlxKey, Dynamic> = [
		ONE => 1, NUMPADONE => 1,
		TWO => 2, NUMPADTWO => 2,
		THREE => 3, NUMPADTHREE => 3,
		FOUR => 4, NUMPADFOUR => 4, 
        FIVE => 5, NUMPADFIVE => 5, 
        SIX => 6, NUMPADSIX => 6, 
        SEVEN => 7, NUMPADSEVEN => 7, 
        EIGHT => 8, NUMPADEIGHT => 8, 
        NINE => 9, NUMPADNINE => 9, 
        ZERO => 0, NUMPADZERO => 0,
        SPACE => ' ',
        PERIOD => '.',
        GRAVEACCENT => '`',
        NUMPADPERIOD => '.',
        SLASH => '/',
        BACKSLASH => '\\',
        LBRACKET => '{',
        RBRACKET => '}',
	];

	override function update(elapsed:Float)
	{
        if (CAN_TYPE)
		{
			typeUpdate();
		}

        if (CAN_TYPE) {
            text.text = '$setText<';
            text.screenCenter();
        }

		super.update(elapsed);
	}

	var setText:String = "";

	function updateText(newtext:String)
		setText = newtext;

	function typeUpdate()
	{
		if (FlxG.keys.anyJustReleased(keys))
		{
			for (key in keys)
			{
				if (FlxG.keys.anyJustReleased([key]))
				{
					var add:String = key.toString();
                    if (specialLetters.exists(key)) add = Std.string(specialLetters.get(key));

					updateText(setText + add);
				}
			}
		}

		if (FlxG.keys.pressed.BACKSPACE)
			updateText(setText.substring(0, setText.length - 1));
	}
}
