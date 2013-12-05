package game.play.entities.wall 
{
	import game.levels.Cell;
	import util.graphics.ProgrammaticGraphic;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class WallSprite extends ProgrammaticGraphic 
	{
		private var	_color:uint;
		
		public function WallSprite() 
		{
			_color = Random.choice(0x202020, 0x242424, 0x282828, 0x2c2c2c);
		}
		
		override protected function draw():void 
		{
			_graphics.beginFill(_color);
			_graphics.drawRect(0, 0, Cell.WIDTH, Cell.HEIGHT);
			_graphics.endFill();
		}
	}

}