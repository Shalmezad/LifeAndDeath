package  
{
	import org.flixel.FlxGroup;
	
	public class LifeGrid extends FlxGroup
	{
		private var grid:Array;  //grid[x][y]
		private var width:int;
		private var height:int;
		private var x:int;
		private var y:int;
		
		public function LifeGrid(xTiles:int = 0, yTiles:int = 0, xOffset:int = 50, yOffset:int = 50) 
		{
			width = xTiles;
			height = yTiles;
			x = xOffset;
			y = yOffset;
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
		
		public function setTile(x:int, y:int, player:int):void {
			(grid[x][y] as GridCell).player = player;
			(grid[x][y] as GridCell).redoGraphic();
		}
		
		public function getCell(x:int, y:int):int {
			if(x > 0 && y > 0 && x < width && y < height){
				return (grid[x][y] as GridCell).player;
			}
			else {
				return 0;
			}
		}
		
		public function countNeighbors(x:int, y:int, type:int):int
		{
			//Counts neighbors of this type.
			var neighbors:int = 0;
			if (getCell(x - 1, y - 1) == type) {
				neighbors++;
			}
			if (getCell(x + 1, y - 1) == type) {
				neighbors++;
			}
			if (getCell(x - 1, y + 1) == type) {
				neighbors++;
			}
			if (getCell(x + 1, y + 1) == type) {
				neighbors++;
			}
			if (getCell(x - 1, y) == type) {
				neighbors++;
			}
			if (getCell(x + 1, y) == type) {
				neighbors++;
			}
			if (getCell(x, y-1) == type) {
				neighbors++;
			}
			if (getCell(x, y+1) == type) {
				neighbors++;
			}
			
			return neighbors;
		}
		
		public function getCellChange(x:int, y:int):int {
			//return what the cells new value "would" be after the step
			var p1neighbors:int = countNeighbors(x, y, 1);
			var p2neighbors:int = countNeighbors(x, y, 2);
			var neutralneighbors:int = countNeighbors(x, y, 3);
			var totalNeighbors:int = p1neighbors + p2neighbors + neutralneighbors;
			
			//what are we?
			var cellType:int = (grid[x][y] as GridCell).player;
			if (cellType > 0) {
				//we are a living cell.
				//can we remain alive?
				if (totalNeighbors < 2 || totalNeighbors > 3) {
					//we're over/under crowded. Blech.
					return 0;
				}
				else {
					return cellType;
				}
			}
			else {
				//we are a dead cell.
				//we need 3 to live.
				if (totalNeighbors == 3) {
					//we are born!
					//what type are we?
					if (p1neighbors > p2neighbors) {
						return 1;
					}
					else if (p2neighbors > p1neighbors) {
						return 2;
					}
					else {
						return 3;
					}
				}
				else {
					trace(x.toString() + "," + y.toString());
					return 0;
				}
			}
		}
		
		public function step():void
		{
			//Alright, we need to create a new grid temporarily...
			var newGrid:Array = new Array();
			for (var a:int = 0; a < width; a++) {
				newGrid.push(new Array());
				for (var b:int = 0; b < height; b++) {
					newGrid[a].push(0);
				}
			}
			//the new grid will hold the array of values.
			//so now we cycle through.
			for (var c:int = 0; c < width; c++) {
				for (var d:int = 0; d < height ; d++) {
					newGrid[c][d] = getCellChange(c, d);
				}
			}
			//finally, we change everything.
			for (var i:int = 0; i < width; i++) {
				for (var j:int = 0; j < height ; j++) {
					//(grid[e][f] as GridCell).player = newGrid[e][f];
					setTile(i, j, newGrid[i][j]);
				}
			}
		}
		
		public function handleClick(mX:int, mY:int, player:int) :void
		{
			//what tile?
			var xTile:int;
			var yTile:int;
			xTile = mX / GridCell.WIDTH - x;
			yTile = mY / GridCell.HEIGHT - y;
			//are we in bounds?
			if (xTile < 0 || yTile < 0) {
				return;
			}
			if (xTile >= width || yTile >= height) {
				return;
			}
			//we are legal. Get the tile.
			var cell:int = getCell(xTile, yTile);
			if (cell == 0) {
				setTile(xTile, yTile, player);
			}
			else {
				setTile(xTile, yTile, 0);
			}
		}
	}

}