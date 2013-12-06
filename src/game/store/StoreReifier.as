package game.store 
{
	import game.common.entities.stairs.Stairs;
	import game.common.playthrough.palettes.Palette;
	import game.common.playthrough.Playthrough;
	import game.common.reification.LevelReifier;
	import game.levels.Level;
	import game.play.PlayWorld;
	import game.store.entities.life.Life;
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
			
			entities.push(new Life(Level.PIXEL_CENTER.x, Level.PIXEL_CENTER.y - 100, _playthrough));
			
			return entities;
		}
		
		override protected function get floorPalette():Palette
		{
			return _playthrough.storeFloorPalette;
		}
	}

}