package  
{
	import org.flixel.*;
	public class GridCell extends FlxSprite
	{
		public static const WIDTH = 8;
		public static const HEIGHT = 8;
		public function GridCell() 
		{
			makeGraphic(WIDTH-2, HEIGHT-2, 0xffdd0000);
		}
		
	}

}