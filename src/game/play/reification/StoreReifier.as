package game.play.reification 
{
	import game.levels.Level;
	import game.play.entities.stairs.Stairs;
	import game.play.Playthrough;
	import game.play.worlds.PlayWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author beyamor
	 */
	public class StoreReifier extends LevelReifier 
	{
		private var	_playthrough:Playthrough;
		
		public function StoreReifier(playthrough:Playthrough) 
		{
			super();
			
			_playthrough = playthrough;
		}
		
		override public function reify(level:Level):Vector.<Entity> 
		{
			var entities:Vector.<Entity> = super.reify(level);
			
			entities.push(new Stairs(function():void {
				
				++_playthrough.depth;
				FP.world = new PlayWorld(_playthrough)
			}));
			
			return entities;
		}
	}

}