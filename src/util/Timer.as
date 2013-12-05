package util 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Timer implements Updateable
	{
		public var	period:Number;
		
		private var	_onEnd:Function,
					_onTick:Function,
					_elapsed:Number,
					_loops:Boolean,
					_stopped:Boolean	= false;
		
		public function Timer(args:Object) 
		{
			this.period	= args.period;
			_onEnd		= args.onEnd;
			_onTick		= args.onTick;
			_loops		= args.loops;
			_elapsed	= 0;
		}
		
		public function restart():void {
			
			_elapsed	= 0;
			_stopped	= false;
		}
		
		public function update():void {
			
			_elapsed += FP.elapsed;
			
			if (_onTick) _onTick();
			
			if (_loops) {
				
				while (_elapsed >= period) {
					
					_onEnd();
					_elapsed -= period;
				}
			}
			else {
					
				if (_elapsed >= period && !_stopped) {
					
					_stopped = true;
					if (_onEnd != null) _onEnd();
				}
			}
		}
		
		public function get percentElapsed():Number {
			
			return Math.min(1, (_elapsed / period));
		}
	}

}