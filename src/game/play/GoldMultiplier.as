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
		public static const	BASE:Number			= 1,
							INCREMENT:Number	= 0.25,
							LIFESPAN:Number		= 2;
							
		private var	_killTimer:Timer,
					_isAlive:Boolean;
					
		public var	value:Number;
		
		public function GoldMultiplier() 
		{
			_isAlive	= false;
			value		= BASE;
			
			_killTimer = new Timer( {
				period:	LIFESPAN,
				callback: Fn.bind(this, function():void {
					
					_isAlive	= false;
					value		= BASE;
				})
			});
		}
		
		public function update():void {
			
			if (_isAlive) _killTimer.update();
		}
		
		public function tap():void {
			
			_isAlive	= true;
			value		+= INCREMENT;
			_killTimer.restart();
		}
	}

}