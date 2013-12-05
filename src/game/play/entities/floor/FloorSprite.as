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
		
		public function FloorSprite() 
		{
			_color = Random.choice(0xEDDFB2, 0xF2E3B1, 0xF0E3BB);
		}
		
		override protected function draw():void 
		{
			_graphics.beginFill(_color);
			_graphics.drawRect(0, 0, Cell.WIDTH, Cell.HEIGHT);
			_graphics.endFill();
		}
	}

}