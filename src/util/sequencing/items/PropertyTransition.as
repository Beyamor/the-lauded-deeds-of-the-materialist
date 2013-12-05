package util.sequencing.items 
{
	import util.sequencing.SequenceItem;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PropertyTransition implements SequenceItem 
	{
		private var	_timer:Timer;
		
		public function PropertyTransition(thing:Object, opts:Object) 
		{
			_timer = new Timer( {
				period:		(opts.duration? opts.duration : 1),
				onTick:		function():void {
					
					thing[opts.property] = opts.from + (opts.to - opts.from) * _timer.percentElapsed;
				}
			});
		}
		
		/* INTERFACE util.sequencing.SequenceItem */
		
		public function get isFinished():Boolean 
		{
			return _timer.hasFinished;
		}
		
		public function update():void 
		{
			_timer.update();
		}
		
	}

}