package game.play 
{
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;
	import game.levels.Cell;
	import game.play.entities.enemies.seeker.Seeker;
	import game.play.entities.enemies.Values;
	import game.play.entities.enemies.wanderer.Wanderer;
	import game.play.entities.floor.Floor;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import util.Fn;
	import util.Random;
	import util.sequencing.items.Delay;
	import util.sequencing.items.SequencedCallback;
	import util.sequencing.Sequencer;
	import util.Timer;
	import util.Updateable;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Spawner implements Updateable
	{
		public static const	ENEMY_CLASSES:Array = [Seeker, Wanderer];
		
		private var	_sequence:Sequencer,
					_budget:int,
					_world:World;
		
		public function Spawner(world:PlayWorld) 
		{			
			_world		= world;
			_sequence	= new Sequencer();
			_budget		= 1000;
			
			var	spawn:Function = Fn.bind(this, function():void {
				
				var	enemyClass:Class	= Random.any(ENEMY_CLASSES),
					position:Point		= getEnemyLocation(),
					enemy:Entity		= new enemyClass(position.x, position.y);
		
				world.add(enemy);					
				_budget -= Values.lookup(enemyClass);
				
				if (_budget > 0) {
					
					_sequence.add(
						new Delay(Random.inRange(0.5, 1)),
						new SequencedCallback(spawn)
					);
				}
			});
			
			_sequence.add(
				new Delay(2),
				new SequencedCallback(spawn)
			);
		}
		
		private function getEnemyLocation():Point {
			
		var	floors:Vector.<Entity>		= new Vector.<Entity>,
			emptyFloors:Vector.<Entity>	= new Vector.<Entity>;
			
			_world.getClass(Floor, floors);
			for each (var floor:Entity in floors) {
				
				if (!floor.collide("player", floor.x, floor.y)) emptyFloors.push(floor);
			}
			
			var	selectedFloor:Entity = Random.any(emptyFloors);
			return new Point(selectedFloor.centerX, selectedFloor.centerY);
		}
		
		public function update():void {
			
			_sequence.update();
		}
		
		public function get isFinished():Boolean {
			
			return _sequence.isEmpty;
		}
	}

}