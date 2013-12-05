package util.sequencing.items.effects 
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
					})
				}));
			}
		}
		
		public function stop():void {
			
			_isFinished		= true;
			_thing.visible	= true;
		}
		
		public function update():void 
		{
			_timers.update();
		}
		
		public function get isFinished():Boolean {
			
			return _isFinished;
		}
	}

}