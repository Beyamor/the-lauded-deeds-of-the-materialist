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
			
			if (xVel != 0 || yVel != 0) {
				
				var	realXVel:Number	= xVel * FP.elapsed,
					realYVel:Number	= yVel * FP.elapsed,
					xSteps:Number	= Math.abs(realXVel),
					ySteps:Number	= Math.abs(realYVel),
					xStep:int		= FP.sign(realXVel),
					yStep:int		= FP.sign(realYVel),
					type:String,
					collision:Entity,
					xStop:Boolean	= false,
					yStop:Boolean	= false;
					
				while (xSteps > 0 || ySteps > 0) {
					
					if (xSteps > 0) {
							
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
					
					if (ySteps > 0) {
						
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
			
			// this is kinda hackyyyy
			else {
				
				var collidedWithType:Object = { };
				
				for each (var delta:Array in [[0, 0], [1, 0], [ -1, 0], [0, 1], [0, -1]]) {
					
					var	dx:Number = delta[0],
						dy:Number = delta[1];
					
					for (type in collisionHandlers) {
						if (collidedWithType[type]) continue;
						
						collision = collide(type, x + dx, y + dy);
						if (collision) {
							
							collisionHandlers[type](collision);
							collidedWithType[type] = true;
						}
					}
				}
			}
		}
		
		public function removeFromWorld():void {
			if (world) world.remove(this);
		}
	}

}