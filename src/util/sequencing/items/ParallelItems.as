package util.sequencing.items 
{
	import util.sequencing.SequenceItem;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ParallelItems implements SequenceItem 
	{
		private var	_items:Vector.<SequenceItem>;
		
		public function ParallelItems(... items) 
		{
			_items = new Vector.<SequenceItem>();

			for each (var item:SequenceItem in items) {
				
				_items.push(item);
			}
		}
		
		/* INTERFACE util.sequencing.SequenceItem */
		
		public function get isFinished():Boolean 
		{
			for each (var item:SequenceItem in _items) {
				
				if (!item.isFinished) return false;
			}
			
			return true;
		}
		
		public function update():void 
		{
			for each (var item:SequenceItem in _items) {
				
				if (!item.isFinished) item.update();
			}
		}
		
	}

}