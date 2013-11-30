package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.play.PlayWorld;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine 
	{
		public static const	WIDTH:int	= 800,
							HEIGHT:int	= 600;
		
		public function Main():void 
		{
			super(WIDTH, HEIGHT);
			FP.screen.color = 0xFFFFFF;
		}
		
		override public function init():void 
		{
			super.init();
			
			FP.world = new PlayWorld();
		}
		
	}
	
}