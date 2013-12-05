package util.effects 
{
	import util.Fn;
	import util.Timer;
	import util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Fader implements Updateable 
	{
		private var	_timer:Timer,
					_running:Boolean	= false;
		
		public function Fader(thing:*, opts:Object=null) 
		{
			if (!opts) opts = {}
			
			_timer = new Timer( {
				period:	(opts.duration? opts.duration : 1),
				onTick:	function():void {
					
					thing.alpha = fade(_timer.percentElapsed);
				},
				
				onEnd:	Fn.bind(this, function():void {
					
					stop();
					if (opts.onEnd != null) opts.onEnd();
				})
			});
			
			if (opts.start) start();
		}
		
		public function start():void {
			
			_running = true;
		}
		
		public function stop():void {
			
			_running = false;
		}
		
		protected function fade(elapsed:Number):Number {
			
			// Overried in subclass
			return 0.5;
		}
		
		/* INTERFACE util.Updateable */
		
		public function update():void 
		{
			if (_running) _timer.update();
		}
	}

}