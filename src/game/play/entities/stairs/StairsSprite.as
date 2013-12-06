package game.play.entities.stairs 
{
	import net.flashpunk.Entity;
	import util.graphics.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class StairsSprite extends ProgrammaticGraphic 
	{
		private var	_entity:Entity;
		
		public function StairsSprite(entity:Entity) 
		{
			_entity = entity;
			
			centerOn(entity);
		}
		
		override protected function draw():void 
		{
			super.draw();
			
			_graphics.beginFill(0x000000);
			_graphics.lineStyle(3, 0xCE9963);
			_graphics.drawRect(0, 0, _entity.width, _entity.height);
		}
	}

}