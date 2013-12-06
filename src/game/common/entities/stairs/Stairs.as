package game.common.entities.stairs 
{
	import game.common.entities.PlayEntity;
	import game.levels.Level;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Stairs extends PlayEntity 
	{	
		private var	_onExit:Function;
		
		public function Stairs(onExit:Function) 
		{
			_onExit = onExit;
			
			width = height = 56;
			centerOrigin();
			
			super(Level.PIXEL_CENTER.x, Level.PIXEL_CENTER.y, new StairsSprite(this));
			
			level = 150;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed("action") && collide("player", x, y)) {
				
				_onExit();
			}
		}
	}

}