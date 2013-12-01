package util.cameras 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author beyamor
	 */
	public class EntityCamera extends CameraDecorator 
	{
		private var _entity:Entity;
		
		public function EntityCamera(entity:Entity, base:Camera) 
		{
			super(base);
			_entity = entity;
		}
		
		override public function update():void 
		{
			super.update();
			
			x = _entity.x - width / 2;
			y = _entity.y - height / 2;
		}
	}

}