package game.play 
{
	import game.play.entities.floor.FloorSprite;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Playthrough 
	{
		public static const	INITIAL_LIVES:int	= 3;
		
		public var	gold:int	= 0,
					lives:int	= INITIAL_LIVES;
		
		public function Playthrough() 
		{
			
		}
		
		public function start():void {
			
			FloorSprite.restartPaletteCycle();
		}
	}

}