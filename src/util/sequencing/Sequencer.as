package util.sequencing 
{
	import util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Sequencer implements Updateable 
	{
		private var	_items:Vector.<SequenceItem>;
		
		public function Sequencer(... initialItems) 
		{
			_items = new Vector.<SequenceItem>();
			
			for each (var item:SequenceItem in initialItems) {
				
				_items.push(item);
			}
		}
		
		/* INTERFACE util.Updateable */
		
		public function update():void 
		{
			while (!isEmpty) {
				
				var	item:SequenceItem = _items[0];
				
				item.update();
				
				if (item.isFinished) {
					
					_items.shift();
				}
				
				else {
					
					break;
				}
			}
		}
		
		public function get isEmpty():Boolean {
			
			return (_items.length == 0);
		}
		
		public function add(... items):void {
			
			for each (var item:SequenceItem in items) {
				
				_items.push(item);
			}
		}
	}

}