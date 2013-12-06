package game.common.entities.stairs 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import util.graphics.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class StairsSprite extends Image 
	{
		[Embed (source="/images/stairs.png" )]
		public static const SOURCE:Class;
		
		private var	_entity:Entity;
		
		public function StairsSprite(entity:Entity) 
		{
			super(SOURCE);
			
			centerOO();
		}
	}

}