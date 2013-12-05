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
			Seeker:		100
		};
		
		public static function lookup(clazz:Class):int {
			
			var	name:String	= NameUtil.getUnqualifiedClassName(clazz);
			if (!values[name]) throw new Error("No value for " + name);
			return values[name];
		}
	}

}