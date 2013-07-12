package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	public class GameState extends FlxState
	{
		
		override public function create():void
		{
			add(new FlxText(50, 50, 200, "TESTING"));
		}
		
	}

}