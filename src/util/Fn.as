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
		
		public static function bind(self:Object, f:Function):Function {
			
			return function(... args):* {
				return f.apply(self, args);
			}
		}
		
		public static function always(f:Function):Function {
			
			return function(... args):* {
				
				return f();
			}
		}
	}

}