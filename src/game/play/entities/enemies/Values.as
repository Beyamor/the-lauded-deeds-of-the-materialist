package game.play.entities.enemies 
{
	import game.play.entities.enemies.seeker.Seeker;
	import game.play.entities.enemies.wanderer.Wanderer;
	import mx.utils.NameUtil;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Values 
	{
		private static const values:Object = {
			Wanderer:	50,
			Bouncer:	50,
			Seeker:		100
		};
		
		public static function lookup(clazz:Class):int {
			
			var	name:String	= NameUtil.getUnqualifiedClassName(clazz);
			if (!values[name]) throw new Error("No value for " + name);
			return values[name];
		}
		
		public static function get smallest():int {
			
			var result:int = int.MAX_VALUE;
			
			for each (var value:int in values) {
				
				result = Math.min(result, value);
			}
			
			return result;
		}
	}

}