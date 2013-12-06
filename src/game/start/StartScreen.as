package game.start 
{
	import game.common.playthrough.Playthrough;
	import game.play.PlayWorld;
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
			
			if (Input.pressed("action")) {
			
				var	playthrough:Playthrough = new Playthrough();
				
				FP.world = new PlayWorld(playthrough);
			}
		}
	}

}