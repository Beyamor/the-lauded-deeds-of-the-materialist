package game.play.entities.enemies 
{
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
			Seeker:		100,
			Mother:		150,
			Child:		0
		};
		
		public static function lookup(clazz:Class):int {
			
			var	name:String	= NameUtil.getUnqualifiedClassName(clazz);
			if (values[name] == null) throw new Error("No value for " + name);
			return values[name];
		}
	}

}