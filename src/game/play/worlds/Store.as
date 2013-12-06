package game.play.worlds 
{
	import game.levels.constructors.Constructor;
	import game.levels.constructors.StoreConstructor;
	import game.levels.Level;
	import game.play.entities.player.Player;
	import game.play.PlayerCam;
	import game.play.playthrough.Playthrough;
	import game.play.reification.StoreReifier;
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