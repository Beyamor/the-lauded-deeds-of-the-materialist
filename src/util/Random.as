package util 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Random 
	{
		public static function intInRange(min:int, max:int):int {
			
			return min + Math.floor(Math.random() * (max - min));
		}
		
		public static function any(coll:*):* {
			
			var	index:int = intInRange(0, coll.length);
			return coll[index];
		}
		
		public static function choice(...options):* {
			
			return any(options);
		}
		
		public static function get coinFlip():Boolean {
			
			return Math.random() < 0.5;
		}
	}

}