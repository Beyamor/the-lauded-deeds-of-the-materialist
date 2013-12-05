package game.play.entities.floor 
{
	import game.levels.Cell;
	import util.graphics.ProgrammaticGraphic;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FloorSprite extends ProgrammaticGraphic
	{
		public static const	PALETTES:Array = [
			[0xEDDFB2, 0xF2E3B1, 0xF0E3BB],	// whitey-tan
			[0xC0D1AE, 0xB6C9A1, 0xA4BD8A],	// green
			[0xA67041, 0xA8764A, 0xB07846],	// brown
			[0xCCDDE6, 0xD7E5F7, 0xE4ECF0]	// blue			
		];
		
		private static var paletteIndex:int = -1;
		
		private var	_color:uint;
		
		public function FloorSprite() 
		{
			_color = Random.any(PALETTES[paletteIndex]);
		}
		
		override protected function draw():void 
		{
			_graphics.beginFill(_color);
			_graphics.drawRect(0, 0, Cell.WIDTH, Cell.HEIGHT);
			_graphics.endFill();
		}
		
		public static function changeToNextPalette():void {
			
			paletteIndex = (paletteIndex + 1) % PALETTES.length;
		}
		
		public static function restartPaletteCycle():void {
			
			paletteIndex = -1;
		}
	}

}