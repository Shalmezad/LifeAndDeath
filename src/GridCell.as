package  
{
	import org.flixel.*;
	public class GridCell extends FlxSprite
	{
		public static const WIDTH:int = 8;
		public static const HEIGHT:int = 8;
		
		public var player:int = 0;
		//0 = none
		//1 = player1
		//2 = player2
		//3 = combination
		
		public function GridCell() 
		{
			redoGraphic();
		}
		
		
		public function redoGraphic() :void
		{
			switch(player) {
				case 0:
					makeGraphic(WIDTH - 2, HEIGHT - 2, 0xffdd0000);
					break;
				case 1:
					makeGraphic(WIDTH - 2, HEIGHT - 2, 0xff0000ff);
					break;
				case 2:
					makeGraphic(WIDTH - 2, HEIGHT - 2, 0xff00ff00);
					break;
				case 3:
					makeGraphic(WIDTH - 2, HEIGHT - 2, 0xff00ffff);
					break;
			}
		}
		
	}

}