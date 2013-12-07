package game.play.entities.enemies.seeker 
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import game.common.entities.player.Player;
	import game.play.entities.enemies.behaviours.SeekingBehaviour;
	import game.play.entities.enemies.Enemy;
	import game.play.PlayWorld;
	import net.flashpunk.FP;
	import util.Angle;
	import util.graphics.CircularEntitySprite;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Seeker extends Enemy
	{
		public static const	SPEED:Number = 100;
		
		public function Seeker(x:Number, y:Number) 
		{
			super(x, y, new SeekingBehaviour(this, SPEED));
			
			graphic = new CircularEntitySprite(this, {
				color: 0xF05193
			});
		}
	}

}