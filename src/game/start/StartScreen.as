package game.start 
{
	import game.common.playthrough.Playthrough;
	import game.play.PlayWorld;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
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
		
		override public function begin():void 
		{
			super.begin();
			
			var prevSize:int = Text.size;
			
			Text.size = 24;
			var title:Text = new Text("The Lauded Deeds of the Materialist");
			addGraphic(title, 0, 100, 100);
			Text.size = prevSize;
			
			var text:Text = new Text(
				"Move with `WASD`. Shoot with the arrow keys.\n" +
				"Climb stairs and buy lives with `E`.\n\n" +
				"Press `E` to start."
			);
			
			addGraphic(text, 0, 100, 200);
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