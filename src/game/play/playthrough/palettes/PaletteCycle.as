package game.play.playthrough.palettes 
{
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PaletteCycle 
	{
		private var	_palettes:Vector.<Palette> = new Vector.<Palette>,
					_index:int = 0;
		
		public function PaletteCycle(... palettes) 
		{
			for each (var palette:Palette in palettes) _palettes.push(palette);
		}
		
		public function cycle():void {
			
			_index = (_index + 1) % _palettes.length;
		}
		
		public function get current():Palette {
			
			return _palettes[_index];
		}
	}

}