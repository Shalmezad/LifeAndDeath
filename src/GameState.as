package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	public class GameState extends FlxState
	{
		private var grid:LifeGrid;
		private var tick:int = 0;
		override public function create():void
		{
			grid = new LifeGrid(10, 10);
			add(grid);
			
			grid.setTile(3, 3, 1);
			grid.setTile(3, 4, 1);
			grid.setTile(3, 5, 1);
		}
		
		override public function update():void
		{
			super.update();
			tick++
			if(tick >= 30){
				grid.step();
				tick = 0;
			}
		}
	}

}