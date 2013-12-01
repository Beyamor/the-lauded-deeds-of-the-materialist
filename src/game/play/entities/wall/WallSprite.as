package game.play.entities.wall 
{
	import game.Consts;
	import util.ProgrammaticGraphic;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class WallSprite extends ProgrammaticGraphic 
	{
		
		public function WallSprite() 
		{
			var color:uint = Random.choice(0x202020, 0x242424, 0x282828, 0x2c2c2c);
			
			_graphics.beginFill(color);
			_graphics.drawRect(0, 0, Consts.CELL_WIDTH, Consts.CELL_HEIGHT);
			_graphics.endFill();
		}
		
	}

}