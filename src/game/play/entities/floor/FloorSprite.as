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
		private var	_color:uint;
		
		public function FloorSprite(palette:Array) 
		{
			_color = Random.any(palette);
		}
		
		override protected function draw():void 
		{
			_graphics.beginFill(_color);
			_graphics.drawRect(0, 0, Cell.WIDTH, Cell.HEIGHT);
			_graphics.endFill();
		}
	}

}