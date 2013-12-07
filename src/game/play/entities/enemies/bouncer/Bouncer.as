package game.play.entities.enemies.bouncer 
{
	import game.common.entities.wall.Wall;
	import game.levels.Cell;
	import game.play.entities.enemies.behaviours.BouncingBehaviour;
	import game.play.entities.enemies.Enemy;
	import net.flashpunk.Graphic;
	import util.graphics.CircularEntitySprite;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Bouncer extends Enemy 
	{
		public static const	SPEED:int	= 50;
		
		private var	_alreadyBounced:Boolean;
		
		public function Bouncer(x:Number, y:Number) 
		{			
			super(x, y, new BouncingBehaviour(this, SPEED));
			graphic = new CircularEntitySprite(this, {
				color:	0x69D9F0
			});
		}
	}

}