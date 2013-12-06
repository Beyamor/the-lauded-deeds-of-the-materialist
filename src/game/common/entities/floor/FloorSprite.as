package game.common.entities.floor 
{
	import game.common.playthrough.palettes.Palette;
	import game.levels.Cell;
	import util.graphics.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FloorSprite extends ProgrammaticGraphic
	{
		private var	_color:uint;
		
		public function FloorSprite(palette:Palette) 
		{
			_color = palette.anyColor;
		}
		
		override protected function draw():void 
		{
			_graphics.beginFill(_color);
			_graphics.drawRect(0, 0, Cell.WIDTH, Cell.HEIGHT);
			_graphics.endFill();
		}
	}

}