package game.play 
{
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;
	import game.common.entities.floor.Floor;
	import game.levels.Cell;
	import game.play.entities.enemies.bouncer.Bouncer;
	import game.play.entities.enemies.seeker.Seeker;
	import game.play.entities.enemies.Values;
	import game.play.entities.enemies.wanderer.Wanderer;
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
		private var	_sequence:Sequencer,
					_budget:int,
					_world:PlayWorld;
		
		public function Spawner(world:PlayWorld) 
		{			
			_world		= world;
			_sequence	= new Sequencer();
			_budget		= 1000 * world.playthrough.depth;
			
			var	spawn:Function = Fn.bind(this, function():void {
				
				var	classesForDepth:Array			= SpawnPatterns.getClasses(_world.playthrough.depth),
					possibleClasses:Vector.<Class>	= new Vector.<Class>();
					
				for each (var enemyClass:Class in classesForDepth) {
					
					var	value:int = Values.lookup(enemyClass);
					if (value <= _budget) possibleClasses.push(enemyClass);
				}
				
				if (possibleClasses.length == 0) throw new Error("Whoa, no enemies fit the budget");
				
				var	selectedClass:Class	= Random.any(possibleClasses),
					position:Point		= getEnemyLocation(),
					enemy:Entity		= new selectedClass(position.x, position.y);
		
				world.add(enemy);					
				_budget -= Values.lookup(selectedClass);
				
				var smallestValue:int = int.MAX_VALUE;
				for each (enemyClass in classesForDepth) {
					smallestValue = Math.min(smallestValue, Values.lookup(enemyClass));
				}
				
				if (_budget >= smallestValue) {
					
					_sequence.add(
						new Delay(Random.inRange(0.25, 0.5)),
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