package game.start 
{
	import game.play.Playthrough;
	import game.play.worlds.PlayWorld;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class StartScreen extends World 
	{
		
		public function StartScreen() 
		{
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.ANY)) {
			
				var	playthrough:Playthrough = new Playthrough();
				playthrough.start();
				
				FP.world = new PlayWorld(playthrough);
			}
		}
	}

}