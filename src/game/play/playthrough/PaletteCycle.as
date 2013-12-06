package game.play.playthrough 
{
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PaletteCycle 
	{
		private var	_palettes:Array,
					_index:int = 0;
		
		public function PaletteCycle(... palettes) 
		{
			_palettes = palettes;
		}
		
		public function cycle():void {
			
			_index = (_index + 1) % _palettes.length;
		}
		
		public function get current():Array {
			
			return _palettes[_index];
		}
	}

}