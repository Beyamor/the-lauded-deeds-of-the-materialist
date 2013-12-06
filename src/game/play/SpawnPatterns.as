package game.play 
{
	import game.play.entities.enemies.bouncer.Bouncer;
	import game.play.entities.enemies.mother.Mother;
	import game.play.entities.enemies.seeker.Seeker;
	/**
	 * ...
	 * @author beyamor
	 */
	public class SpawnPatterns 
	{
		private static const PATTERNS:Array = [
		//[Bouncer],
		//[Bouncer, Seeker]
		[Mother]
		];
		
		public static function getClasses(depth:int):Array {
			
			depth -= 1; // 1-indexed to 0-index
			if (depth >= PATTERNS.length) depth = PATTERNS.length - 1;
			
			return PATTERNS[depth];
		}
		
	}

}