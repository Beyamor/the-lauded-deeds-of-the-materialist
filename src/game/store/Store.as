package game.store 
{
	import game.common.entities.player.Player;
	import game.common.PlayerCam;
	import game.common.playthrough.Playthrough;
	import game.levels.constructors.Constructor;
	import game.levels.constructors.StoreConstructor;
	import game.levels.Level;
	import game.store.ui.StoreHUD;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import util.UpdateList;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Store extends World 
	{
		private var	_playthrough:Playthrough,
					_updateables:UpdateList;
		
		public function Store(playthrough:Playthrough) 
		{
			_playthrough = playthrough;
		}
	
		override public function begin():void 
		{
			super.begin();
			
			var	constructor:Constructor	= new StoreConstructor(),
				level:Level				= constructor.construct(),
				reifier:StoreReifier	= new StoreReifier(_playthrough);
				
			for each (var entity:Entity in reifier.reify(level)) {
				
				add(entity);
			}
			
			var	player:Player = new Player(Level.PIXEL_CENTER.x, Level.PIXEL_CENTER.y);
			add(player);
			
			add(new StoreHUD(_playthrough));
			
			_updateables = new UpdateList(
				new PlayerCam(this, player)
			);
		}
		
		override public function update():void 
		{
			super.update();
			
			_updateables.update();
		}
	}

}