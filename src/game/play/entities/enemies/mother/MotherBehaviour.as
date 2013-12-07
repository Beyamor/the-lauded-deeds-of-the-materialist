package game.play.entities.enemies.mother 
{
	import game.play.entities.enemies.behaviours.Behaviour;
	import game.play.entities.enemies.Enemy;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MotherBehaviour extends Behaviour 
	{
		private var _base:Behaviour,
					_spawnTimer:Timer;
		
		public function MotherBehaviour(enemy:Enemy, baseBehaviour:Behaviour) 
		{
			super(enemy);
			
			_base = baseBehaviour;
		}
		
		override public function start():void 
		{
			super.start();
			
			_base.start();
			
			_spawnTimer = new Timer( {
				period:	4,
				loops:	true,
				start:	true,
				onEnd:	function():void {
					
					enemy.world.add(new Child(enemy.x, enemy.y));
				}
			});
		}
		
		override public function update():void 
		{
			super.update();
			
			_base.update();
			_spawnTimer.update();
		}
		
		override public function end():void 
		{
			super.end();
			
			_base.end();
		}
	}

}