package util.sequencing.items 
{
	import util.sequencing.SequenceItem;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class SequencedCallback implements SequenceItem 
	{
		private var	_callback:Function;
		
		public function SequencedCallback(callback:Function) 
		{
			_callback = callback;
		}
		
		/* INTERFACE util.sequencing.SequenceItem */
		
		public function get isFinished():Boolean 
		{
			return true;
		}
		
		public function update():void 
		{
			_callback();
		}
		
	}

}