package game.play 
{
	import util.Fn;
	import util.Timer;
	import util.Updateable;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldMultiplier implements Updateable
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
				onEnd:	Fn.bind(this, function():void {
					
					_decrementTimer.restart();
					_isAlive = false;
				})
			});
			
			_decrementTimer = new Timer( {
				period:	DECREMENT_RATE,
				loops:	true,
				onEnd:	Fn.bind(this, function():void {
					
					value = Math.max(BASE, value - DECREMENT);
				})
			});
		}
		
		public function update():void {
			
			if (_isAlive)			_killTimer.update();
			else if (value > BASE)	_decrementTimer.update();
		}
		
		public function tap():void {
			
			_isAlive = true;
			value += INCREMENT;
			_killTimer.restart();
		}
		
		public function get isAlive():Boolean {
			
			return _isAlive
		}
		
		public function get isDying():Boolean {
			
			return (!_isAlive) && (value > BASE);
		}
		
		public function kill():void {
			
			_isAlive	= false;
			value		= BASE;
		}
	}

}