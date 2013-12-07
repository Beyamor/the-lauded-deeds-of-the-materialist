package game.play.entities.enemies.behaviours 
{
	import game.play.entities.enemies.Enemy;
	import util.Updateable;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Behaviour implements Updateable
	{
		protected var enemy:Enemy;
		
		public function Behaviour(enemy:Enemy) 
		{
			this.enemy = enemy;
		}
		
		public function start():void {
			
			// Override in subclass
		}
		
		public function update():void {
			
			// Override in subclass
		}
		
		public function end():void {
			
			// Override in subclass
		}
	}

}