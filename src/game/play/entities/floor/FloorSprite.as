package game.play.entities.floor 
{
	import game.levels.Cell;
	import util.ProgrammaticGraphic;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FloorSprite extends ProgrammaticGraphic 
	{
		
		public function FloorSprite() 
		{
			var color:uint = Random.choice(0xEDDFB2, 0xF2E3B1, 0xF0E3BB);
			
			_graphics.beginFill(color);
			_graphics.drawRect(0, 0, Cell.WIDTH, Cell.HEIGHT);
			_graphics.endFill();
		}
	}

}