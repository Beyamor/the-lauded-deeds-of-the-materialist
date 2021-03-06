package game.play.ui 
{
	import game.common.playthrough.Playthrough;
	import game.Main;
	import game.play.PlayWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameOverScreen extends Entity 
	{
		
		public function GameOverScreen(playthrough:Playthrough) 
		{
			centerOrigin();
			
			var	text:Text = new Text(
				"Game Over!\n" +
				"You collected " + playthrough.gold + " gold and made it " +
					playthrough.depth + " level" + (playthrough.depth > 1? "s" : "") + " down\n" +
				"Press `E` to play again");
			text.centerOO();
			
			super(0, 0, text);
		}
		
		override public function added():void 
		{
			super.added();
			
			x = world.camera.x + FP.halfWidth;
			y = world.camera.y + FP.halfHeight;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed("action")) FP.world = new PlayWorld(new Playthrough);
		}
	}

}