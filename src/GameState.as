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
			grid = new LifeGrid(32, 24,0,0);
			add(grid);
			
			
			grid.setTile(20, 20, 1);
			grid.setTile(20, 21, 1);
			grid.setTile(20, 22, 1);
			grid.setTile(21, 20, 1);
			grid.setTile(22, 21, 1);
		}
		
		override public function update():void
		{
			super.update();
			tick++
			if(tick >= 5){
				grid.step();
				tick = 0;
			}
		}
	}

}