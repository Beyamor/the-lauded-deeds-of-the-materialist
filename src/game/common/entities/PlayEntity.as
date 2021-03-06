package game.common.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import util.UpdateList;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayEntity extends Entity 
	{
		public var	xVel:Number	= 0,
					yVel:Number	= 0,
					collisionHandlers:Object;
					
		private var	_direction:Number = 0;
		
		protected var updateables:UpdateList;
		
		public function PlayEntity(x:Number, y:Number, graphic:Graphic) 
		{
			super(x, y, graphic);
			
			if (!collisionHandlers) collisionHandlers = { };
			
			updateables = new UpdateList();
		}
		
		public function get direction():Number {
			
			return Math.atan2(xVel, yVel);
		}
		
		public function set direction(newDirection:Number):void {
			
			var	currentSpeed:Number	= speed;
			
			xVel = Math.cos(newDirection) * currentSpeed;
			yVel = Math.sin(newDirection) * currentSpeed;
			
			_direction = newDirection;
		}
		
		public function get speed():Number {
			
			return Math.sqrt(xVel * xVel + yVel * yVel);
		}
		
		public function set speed(newSpeed:Number):void {
			
			var	currentDirection:Number = direction;
			
			xVel = Math.cos(currentDirection) * newSpeed;
			yVel = Math.sin(currentDirection) * newSpeed;
		}
		
		override public function update():void 
		{
			super.update();
			
			updateables.update();
			
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
					
				if (xSteps < 0.05) xSteps = 0;
				if (ySteps < 0.05) ySteps = 0;
					
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
			
			else {
				for (type in collisionHandlers) {
					
					collision = collide(type, x, y);
					if (collision) {
						
						collisionHandlers[type](collision);
					}
				}
			}
		}
		
		public function removeFromWorld():void {
			if (world) world.remove(this);
		}
	}

}