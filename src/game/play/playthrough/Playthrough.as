package game.play.playthrough 
{
	import game.play.entities.floor.FloorSprite;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Playthrough 
	{
		public static const	INITIAL_LIVES:int	= 3;
		
		public var	gold:int	= 0,
					lives:int	= INITIAL_LIVES,
					regularFloorPalettes:PaletteCycle,
					storeFloorPalette:Array;
					
		private var	_depth:int	= 1;
		
		public function Playthrough() 
		{
			regularFloorPalettes = new PaletteCycle(
				[0xEDDFB2, 0xF2E3B1, 0xF0E3BB],	// whitey-tan
				[0xC0D1AE, 0xB6C9A1, 0xA4BD8A],	// green
				[0xA67041, 0xA8764A, 0xB07846],	// brown
				[0xCCDDE6, 0xD7E5F7, 0xE4ECF0]	// blue	
			);
			
			storeFloorPalette = [0x000000];
		}
		
		public function increaseDepth():void {
			
			++_depth;
			regularFloorPalettes.cycle();
		}
		
		public function get depth():int {
			
			return _depth;
		}
	}

}