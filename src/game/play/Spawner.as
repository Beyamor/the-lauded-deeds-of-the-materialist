package game.play 
{
	import game.levels.Cell;
	import game.play.entities.enemies.seeker.Seeker;
	import game.play.entities.enemies.wanderer.Wanderer;
	import game.play.entities.floor.Floor;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import util.Fn;
	import util.Random;
	import util.Timer;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Spawner 
	{
		private var	_timer:Timer;
		
		public function Spawner(world:PlayWorld) 
		{
			_timer	= new Timer( {
				period:	Random.inRange(1, 2),
				callback: Fn.bind(this, function():void {
					
					var	enemyClass:Class			= Random.choice(Seeker, Wanderer, Wanderer, Wanderer),
						floors:Vector.<Entity>		= new Vector.<Entity>,
						emptyFloors:Vector.<Entity>	= new Vector.<Entity>;
						
					world.getClass(Floor, floors);
					for each (var floor:Entity in floors) {
						
						if (!floor.collide("player", floor.x, floor.y)) emptyFloors.push(floor);
					}
					
					var	selectedFloor:Entity	= Random.any(emptyFloors),
						enemy:Entity			= new enemyClass(selectedFloor.centerX, selectedFloor.centerY);
					
					world.add(enemy);
					
					_timer.period = Random.inRange(0.5, 1);
					_timer.restart();
				})
			});
		}
		
		public function update():void {
			
			_timer.update();
		}
	}

}