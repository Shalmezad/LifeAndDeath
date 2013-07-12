package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	public class GameState extends FlxState
	{
		
		override public function create():void
		{
			add(new LifeGrid(10, 10));
		}
		
	}

}