package game.store.entities.life 
{
	import game.common.playthrough.Playthrough;
	import net.flashpunk.Entity;
	
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
			
			return Math.pow(1000, _playthrough.livesPurchased + 1);
		}
		
		public function get canBeAfforded():Boolean {
			
			return (price <= _playthrough.gold);
		}
	}

}