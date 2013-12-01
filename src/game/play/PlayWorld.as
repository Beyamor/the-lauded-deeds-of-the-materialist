package game.play 
{
	import game.levels.Level;
	import game.play.entities.player.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayWorld extends World 
	{
		
		public function PlayWorld() 
		{
			super();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			add(new Player(0, 0));
			
			var level:Level				= new Level(),
				reifier:LevelReifier	= new LevelReifier();
				
			for each (var entity:Entity in reifier.reify(level)) {
				
				add(entity);
			}
		}
	}

}