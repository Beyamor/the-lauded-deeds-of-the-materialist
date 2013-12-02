package util 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Angle 
	{
		public static function between(p1:*, p2:*):Number {
			
			var	dx:Number	= p2.x - p1.x,
				dy:Number	= p2.y - p1.y;
				
			return Math.atan2(dy, dx);
		}
	}

}