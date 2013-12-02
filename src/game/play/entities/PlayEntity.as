package game.play.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayEntity extends Entity 
	{
		public var	xVel:Number,
					yVel:Number,
					collisionHandlers:Object;
		
		public function PlayEntity(x:Number, y:Number, graphic:Graphic) 
		{
			super(x, y, graphic);
			
			if (!collisionHandlers) collisionHandlers = { };
		}
		
		override public function update():void 
		{
			super.update();
			
			var	realXVel:Number	= xVel * FP.elapsed,
				realYVel:Number	= yVel * FP.elapsed,
				xSteps:int		= Math.floor(Math.abs(realXVel)),
				ySteps:int		= Math.floor(Math.abs(realYVel)),
				xStep:int		= FP.sign(realXVel),
				yStep:int		= FP.sign(realYVel),
				type:String,
				collision:Entity,
				xStop:Boolean	= false,
				yStop:Boolean	= false;
				
			while (xSteps > 1 || ySteps > 1) {
				
				if (xSteps > 1) {
						
					for (type in collisionHandlers) {
						
						collision = collide(type, x + xStep, y);
						if (collision && collisionHandlers[type](collision)) {
							
							xStop	= true;
							xSteps	= 0;
							break;
						}
					}
					
					if (!xStop) x += xStep;
					xSteps -= 1;
				}
				
				if (ySteps > 1) {
					
					for (type in collisionHandlers) {
						
						collision = collide(type, x, y + yStep);
						if (collision && collisionHandlers[type](collision)) {
							
							yStop	= true;
							ySteps	= 0;
							break;
						}
					}
					
					if (!yStop) y += yStep;
					ySteps -= 1;
				}
			}
		}
		
		public function removeFromWorld():void {
			if (world) world.remove(this);
		}
	}

}