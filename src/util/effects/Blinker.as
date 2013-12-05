package util.effects 
{
	import net.flashpunk.Entity;
	import util.Fn;
	import util.sequencing.SequenceItem;
	import util.Timer;
	import util.Updateable;
	import util.UpdateList;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Blinker implements SequenceItem 
	{
		private var	_timers:UpdateList,
					_isRunning:Boolean = false,
					_thing:*,
					_isFinished:Boolean	= false;
		
		public function Blinker(thing:*, opts:Object=null) 
		{
			if (!opts) opts = { };
			
			_timers	= new UpdateList();
			_thing	= thing;
			
			// Blinking
			_timers.add(new Timer( {
					period:	(opts.period? opts.period : 0.1),
					loops:	true,
					onEnd:	function():void {
						
						thing.visible = !thing.visible;
					}
			}));
			
			if (opts.duration) {
				
				// Stopping
				_timers.add(new Timer({
					period:	opts.duration,
					onEnd:	Fn.bind(this, function():void {
						
						stop();
						if (opts.onEnd) opts.onEnd();
						_isFinished = true;
					})
				}));
			}
			
			if (opts.start) start();
		}
		
		public function start():void {
			
			_isRunning = true;
		}
		
		public function stop():void {
			
			_isRunning = false;
			_thing.visible = true;
		}
		
		public function update():void 
		{
			if (_isRunning) {
				
				_timers.update();
			}
		}
		
		public function get isFinished():Boolean {
			
			return _isFinished;
		}
	}

}