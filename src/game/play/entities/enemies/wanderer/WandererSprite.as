package game.play.entities.enemies.wanderer 
{
	import net.flashpunk.Entity;
	import util.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class WandererSprite extends ProgrammaticGraphic 
	{
		public function WandererSprite(entity:Entity) 
		{
			_graphics.lineStyle(3, 0x288025);
			_graphics.drawCircle(entity.halfWidth + 2, entity.halfHeight + 2, entity.halfWidth - 2);
			_graphics.endFill();
			
			center(entity.width, entity.height);
		}
		
	}

}