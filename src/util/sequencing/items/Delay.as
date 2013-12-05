package util.sequencing.items 
{
	import net.flashpunk.FP;
	import util.sequencing.SequenceItem;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Delay implements SequenceItem 
	{
		private var	_duration:Number,
					_elapsed:Number;
		
		public function Delay(durationInSeconds:Number)
		{
			_duration	= durationInSeconds;
			_elapsed	= 0;
		}
		
		/* INTERFACE util.sequencing.SequenceItem */
		
		public function get isFinished():Boolean 
		{
			return (_elapsed >= _duration);
		}
		
		public function update():void 
		{
			_elapsed += FP.elapsed;
		}
	}

}