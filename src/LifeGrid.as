package  
{
	import org.flixel.FlxGroup;
	
	public class LifeGrid extends FlxGroup
	{
		private var grid:Array;  
		public function LifeGrid(xTiles:int = 0, yTiles:int = 0, xOffset:int = 50, yOffset:int = 50) 
		{
			//alright, we know what size this is. Make the grid.
			grid = new Array();
			for (var a:int = 0; a < xTiles; a++) {
				grid.push(new Array);
				for (var b:int = 0; b < yTiles; b++) {
					var cell:GridCell = new GridCell();
					cell.x = a * GridCell.WIDTH + xOffset;
					cell.y = b * GridCell.HEIGHT + yOffset;
					grid[a].push(cell);
					add(cell);
				}
			}
		}
		
	}

}