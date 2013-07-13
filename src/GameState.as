package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var grid:LifeGrid;
		private var tick:int = 0;
		private var playerTurn:int = 1;
		
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
			handleInput();
		}
		
		private function handleInput():void
		{
			if (FlxG.mouse.justReleased()) {
				//mouse was just released, get the coordinates.
				var xPos:int = FlxG.mouse.x;
				var yPos:int = FlxG.mouse.y;
				grid.handleClick(xPos, yPos, playerTurn);
				
				playerTurn += 1;
				if (playerTurn > 2) {
					playerTurn = 1;
				}
			}
			if (FlxG.keys.justReleased("SPACE")) {
				grid.step();
				playerTurn += 1;
				if (playerTurn > 2) {
					playerTurn = 1;
				}
			}
		}
	}

}