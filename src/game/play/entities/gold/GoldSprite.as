package game.play.entities.gold 
{
	import net.flashpunk.Entity;
	import util.graphics.CircularEntitySprite;
	import util.graphics.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldSprite extends ProgrammaticGraphic 
	{
		private var	_entity:Entity;
		
		public function GoldSprite(entity:Entity) 
		{
			_entity = entity;
			centerOn(entity);
		}
		
		override protected function draw():void 
		{
			_graphics.beginFill(0xD6A742);
			_graphics.drawRect(0, 0, _entity.width, _entity.height);
			_graphics.endFill();
		}
	}

}