package game.common.playthrough 
{
	import game.common.playthrough.palettes.Palette;
	import game.common.playthrough.palettes.PaletteCycle;
	import game.store.entities.life.Life;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Playthrough 
	{
		public static const	INITIAL_LIVES:int	= 3;
		
		public var	gold:int			= 0,
					lives:int			= INITIAL_LIVES,
					regularFloorPalettes:PaletteCycle,
					storeFloorPalette:Palette,
					livesPurchased:int	= 0;
					
		private var	_depth:int	= 1;
		
		public function Playthrough() 
		{
			regularFloorPalettes = new PaletteCycle(
				Palette.TAN_FLOOR,
				Palette.GREEN_FLOOR,
				Palette.BROWN_FLOOR,
				Palette.BLUE_FLOOR
			);
			
			storeFloorPalette = Palette.STORE_FLOOR;
		}
		
		public function increaseDepth():void {
			
			++_depth;
			regularFloorPalettes.cycle();
		}
		
		public function get depth():int {
			
			return _depth;
		}
		
		public function purchase(life:Life):void {
			
			if (gold < life.price) throw new Error("Can't afford life");
			
			gold			-= life.price;
			lives			+= 1;
			livesPurchased	+= 1;
		}
	}

}