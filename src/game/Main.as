package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.start.StartScreen;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine 
	{
		public static const	WIDTH:int	= 640,
							HEIGHT:int	= 480;
		
		public function Main():void 
		{
			super(WIDTH, HEIGHT);
			FP.screen.color = 0x000000;
		}
		
		override public function init():void 
		{
			super.init();
			
			//FP.console.enable();
			
			Input.define("move-up", Key.W);
			Input.define("move-down", Key.S);
			Input.define("move-left", Key.A);
			Input.define("move-right", Key.D);
			Input.define("shoot-up", Key.UP);
			Input.define("shoot-down", Key.DOWN);
			Input.define("shoot-left", Key.LEFT);
			Input.define("shoot-right", Key.RIGHT);
			Input.define("restart", Key.R);
			Input.define("action", Key.E);
			
			FP.world = new StartScreen();
		}
		
	}
	
}