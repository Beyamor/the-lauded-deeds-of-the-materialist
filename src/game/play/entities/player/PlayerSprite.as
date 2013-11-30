package game.play.entities.player 
{	
	import util.ProgrammaticGraphic;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerSprite extends ProgrammaticGraphic 
	{		
		public function PlayerSprite() 
		{
			super();
			
			_graphics.beginFill(0, 0);
			_graphics.lineStyle(3, 0x404040);
			_graphics.drawCircle(24, 24, 20);
			_graphics.endFill();
		}
	}

}