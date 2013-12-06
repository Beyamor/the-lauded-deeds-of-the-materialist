package game.play.reification 
{
	import game.levels.Level;
	import game.play.entities.stairs.Stairs;
	import game.play.playthrough.Playthrough;
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
		public function StoreReifier(playthrough:Playthrough) 
		{
			super(playthrough);
		}
		
		override public function reify(level:Level):Vector.<Entity> 
		{
			var entities:Vector.<Entity> = super.reify(level);
			
			entities.push(new Stairs(function():void {
				
				_playthrough.increaseDepth();
				FP.world = new PlayWorld(_playthrough)
			}));
			
			return entities;
		}
		
		override protected function get floorPalette():Array 
		{
			return _playthrough.storeFloorPalette;
		}
	}

}