package game.store.entities.life 
{
	import game.common.playthrough.Playthrough;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Life extends Entity 
	{
		private var	_playthrough:Playthrough;
		
		public function Life(x:Number, y:Number, playthrough:Playthrough) 
		{
			width = height = 48;
			centerOrigin();
			
			_playthrough = playthrough;
			
			super(x, y, new LifeGraphic(this));
			
			level = 150;
		}
		
		public function get price():int {
			
			return 1000 * Math.pow(10, _playthrough.livesPurchased);
		}
		
		public function get canBeAfforded():Boolean {
			
			return (price <= _playthrough.gold);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed("action") && canBeAfforded && collide("player", x, y)) {
				
				_playthrough.purchase(this);
				world.remove(this);
			}
		}
	}

}