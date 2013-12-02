package util 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Timer 
	{
		public var	period:Number;
		
		private var	_callback:Function,
					_elapsed:Number,
					_loops:Boolean;
		
		public function Timer(args:Object) 
		{
			this.period	= args.period;
			_callback	= args.callback;
			_loops		= args.loops;
			_elapsed	= 0;
		}
		
		public function restart():void {
			
			_elapsed = 0;
		}
		
		public function update():void {
			
			_elapsed += FP.elapsed;
			if (_loops) {
				
				while (_elapsed >= period) {
					
					_callback();
					_elapsed -= period;
				}
			}
			else {
				
				if (_elapsed >= period) {
					
					_callback();
				}
			}
		}
	}

}