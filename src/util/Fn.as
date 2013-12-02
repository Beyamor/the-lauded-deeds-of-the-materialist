package util 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Fn 
	{
		public static function constantly(value:*):Function {
			
			return function(... _):* {
				return value;
			}
		}
	}

}