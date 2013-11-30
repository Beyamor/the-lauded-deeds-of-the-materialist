package game.play 
{
	import game.play.entities.player.Player;
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
		}
	}

}