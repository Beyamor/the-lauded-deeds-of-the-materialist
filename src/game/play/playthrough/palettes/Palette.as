package game.play.playthrough.palettes 
{
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Palette 
	{
		private var	_colors:Vector.<uint> = new Vector.<uint>;
		
		public function Palette(colors:Array) 
		{
			for each (var color:uint in colors) _colors.push(color);
		}
		
		public function get anyColor():uint {
			
			return Random.any(_colors);
		}
		
		private static function palette(... colors):Palette {
			
			return new Palette(colors);
		}
		
		public static const
			TAN_FLOOR:Palette	 = palette(0xEDDFB2, 0xF2E3B1, 0xF0E3BB),
			GREEN_FLOOR:Palette	= palette(0xC0D1AE, 0xB6C9A1, 0xA4BD8A),
			BROWN_FLOOR:Palette	= palette(0xA67041, 0xA8764A, 0xB07846),
			BLUE_FLOOR:Palette	= palette(0xCCDDE6, 0xD7E5F7, 0xE4ECF0),
			STORE_FLOOR:Palette	= palette(0x000000);
	}

}