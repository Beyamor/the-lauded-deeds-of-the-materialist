package game.play 
{
	import util.Fn;
	import util.Timer;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldMultiplier 
	{
		public static const	BASE:Number				= 1,
							INCREMENT:Number		= 0.1,
							DECREMENT:Number		= INCREMENT,
							LIFESPAN:Number			= 0.75,
							DECREMENT_RATE:Number	= 0.2;
							
		private var	_killTimer:Timer,
					_decrementTimer:Timer,
					_isAlive:Boolean;
					
		public var	value:Number;
		
		public function GoldMultiplier() 
		{
			_isAlive	= false;
			value		= BASE;
			
			_killTimer = new Timer( {
				period:	LIFESPAN,
				callback: Fn.bind(this, function():void {
					
					_isAlive = false;
					_decrementTimer.restart();
				})
			});
			
			_decrementTimer = new Timer( {
				period: DECREMENT_RATE,
				loops: true,
				callback: Fn.bind(this, function():void {
					
					value = Math.max(BASE, value - DECREMENT);
				})
			});
		}
		
		public function update():void {
			
			if (_isAlive)	_killTimer.update();
			else			_decrementTimer.update();
		}
		
		public function tap():void {
			
			_isAlive = true;
			value += INCREMENT;
			_killTimer.restart();
		}
		
		public function get isActive():Boolean {
			
			return value > 1;
		}
	}

}