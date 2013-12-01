package game.play.entities.shot 
{
	import game.Main;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Shot extends Entity 
	{
		public static const	SPEED:Number	= 500,
							WIDTH:int		= 16,
							HEIGHT:int		= 16;
							
		private var	vx:Number,
					vy:Number;
		
		public function Shot(x:Number, y:Number, direction:Number) 
		{
			super(x, y, new ShotSprite());
			
			vx = Math.cos(direction) * SPEED;
			vy = Math.sin(direction) * SPEED;
			
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
		}
		
		override public function update():void 
		{
			super.update();
			
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
			
			if (!collideRect(x, y, 0, 0, Main.WIDTH, Main.HEIGHT)) {
				
				if (world) world.remove(this);
			}
		}
	}

}