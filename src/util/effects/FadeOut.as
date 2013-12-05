package util.effects 
{
	import util.Fn;
	import util.Timer;
	import util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FadeOut implements Updateable 
	{
		private var	_timer:Timer,
					_running:Boolean	= false;
		
		public function FadeOut(thing:*, opts:Object=null) 
		{
			if (!opts) opts = {}
			
			_timer = new Timer( {
				period:	(opts.duration? opts.duration : 1),
				onTick:	function():void {
					
					thing.alpha = 1 - _timer.percentElapsed;
				},
				
				onEnd:	Fn.bind(this, stop)
			});
			
			if (opts.start) start();
		}
		
		public function start():void {
			
			_running = true;
		}
		
		public function stop():void {
			
			_running = false;
		}
		
		/* INTERFACE util.Updateable */
		
		public function update():void 
		{
			if (_running) _timer.update();
		}
		
	}

}