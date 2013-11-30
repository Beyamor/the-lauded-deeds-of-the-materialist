package game.play.entities.player 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends Entity 
	{
		public static const	SPEED:Number	= 300;
		
		public function Player(x:Number, y:Number) 
		{
			super(x, y, new PlayerSprite());
			
			width = height = 48;
		}
		
		override public function update():void 
		{
			super.update();
			
			var	dx:Number	= 0,
				dy:Number	= 0;
				
			if (Input.check("move-up"))		dy -= 1;
			if (Input.check("move-down"))	dy += 1;
			if (Input.check("move-left"))	dx -= 1;
			if (Input.check("move-right"))	dx += 1;
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			x += dx * SPEED * FP.elapsed;
			y += dy * SPEED * FP.elapsed;
		}
	}

}